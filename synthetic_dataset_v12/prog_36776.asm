; DESCRIPTION: Renders a blue box of size 85x13 starting at (358, 231).
; PLAN: r0=358(x), r1=231(y), r2=85(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 231
LDI r2, 85
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
