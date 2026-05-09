; DESCRIPTION: Renders a yellow box of size 90x29 starting at (25, 144).
; PLAN: r0=25(x), r1=144(y), r2=90(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 144
LDI r2, 90
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
