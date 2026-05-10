; DESCRIPTION: Renders a purple box of size 117x83 starting at (37, 141).
; PLAN: r0=37(x), r1=141(y), r2=117(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 141
LDI r2, 117
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
