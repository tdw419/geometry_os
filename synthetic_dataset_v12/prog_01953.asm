; DESCRIPTION: Renders a blue box of size 120x104 starting at (376, 63).
; PLAN: r0=376(x), r1=63(y), r2=120(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 63
LDI r2, 120
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
