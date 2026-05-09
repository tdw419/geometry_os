; DESCRIPTION: Renders a purple box of size 20x104 starting at (350, 7).
; PLAN: r0=350(x), r1=7(y), r2=20(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 7
LDI r2, 20
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
