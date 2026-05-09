; DESCRIPTION: Composite: . Then Draws a orange line from (143, 139) to (135, 64). Then Sets a single magenta pixel at (192, 205).
; PLAN: r0=143(x1), r1=139(y1), r2=135(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=192(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (143, 139) to (135, 64).
; PLAN: r0=143(x1), r1=139(y1), r2=135(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 139
LDI r2, 135
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (192, 205).
; PLAN: r0=192(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 205
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
