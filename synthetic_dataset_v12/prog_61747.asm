; DESCRIPTION: Renders a blue box of size 20x76 starting at (288, 96).
; PLAN: r0=288(x), r1=96(y), r2=20(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 96
LDI r2, 20
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
