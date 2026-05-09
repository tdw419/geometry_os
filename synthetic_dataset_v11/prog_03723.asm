; DESCRIPTION: Renders a purple box of size 117x79 starting at (23, 62).
; PLAN: r0=23(x), r1=62(y), r2=117(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 62
LDI r2, 117
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
