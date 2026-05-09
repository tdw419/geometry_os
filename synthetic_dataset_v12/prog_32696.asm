; DESCRIPTION: Renders a blue box of size 47x56 starting at (273, 147).
; PLAN: r0=273(x), r1=147(y), r2=47(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 147
LDI r2, 47
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
