; DESCRIPTION: Renders a yellow box of size 25x15 starting at (31, 150).
; PLAN: r0=31(x), r1=150(y), r2=25(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 150
LDI r2, 25
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
