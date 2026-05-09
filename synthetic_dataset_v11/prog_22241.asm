; DESCRIPTION: Renders a blue box of size 72x110 starting at (165, 80).
; PLAN: r0=165(x), r1=80(y), r2=72(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 80
LDI r2, 72
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
