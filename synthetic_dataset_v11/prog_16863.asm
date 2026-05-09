; DESCRIPTION: Renders a purple box of size 60x46 starting at (193, 57).
; PLAN: r0=193(x), r1=57(y), r2=60(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 57
LDI r2, 60
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
