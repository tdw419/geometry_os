; DESCRIPTION: Renders a purple box of size 21x70 starting at (350, 62).
; PLAN: r0=350(x), r1=62(y), r2=21(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 62
LDI r2, 21
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
