; DESCRIPTION: Renders a yellow box of size 103x78 starting at (8, 157).
; PLAN: r0=8(x), r1=157(y), r2=103(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 157
LDI r2, 103
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
