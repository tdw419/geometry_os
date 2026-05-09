; DESCRIPTION: Renders a purple box of size 102x79 starting at (108, 70).
; PLAN: r0=108(x), r1=70(y), r2=102(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 70
LDI r2, 102
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
