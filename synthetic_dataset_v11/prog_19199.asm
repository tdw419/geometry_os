; DESCRIPTION: Renders a blue box of size 110x103 starting at (135, 20).
; PLAN: r0=135(x), r1=20(y), r2=110(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 20
LDI r2, 110
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
