; DESCRIPTION: Renders a blue box of size 20x116 starting at (402, 86).
; PLAN: r0=402(x), r1=86(y), r2=20(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 86
LDI r2, 20
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
