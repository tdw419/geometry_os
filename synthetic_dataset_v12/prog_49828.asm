; DESCRIPTION: Renders a blue box of size 53x21 starting at (363, 70).
; PLAN: r0=363(x), r1=70(y), r2=53(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 70
LDI r2, 53
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
