; DESCRIPTION: Renders a purple box of size 78x115 starting at (193, 89).
; PLAN: r0=193(x), r1=89(y), r2=78(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 89
LDI r2, 78
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
