; DESCRIPTION: Composite: . Then Sets a single red pixel at (96, 186). Then Places a purple line segment connecting (224, 126) to (192, 132).
; PLAN: r0=96(x), r1=186(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=224(x1), r1=126(y1), r2=192(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (96, 186).
; PLAN: r0=96(x), r1=186(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 186
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (224, 126) to (192, 132).
; PLAN: r0=224(x1), r1=126(y1), r2=192(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 126
LDI r2, 192
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
