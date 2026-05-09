; DESCRIPTION: Renders a blue box of size 120x79 starting at (17, 100).
; PLAN: r0=17(x), r1=100(y), r2=120(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 100
LDI r2, 120
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
