; DESCRIPTION: Composite: . Then Places a purple line segment connecting (116, 223) to (149, 104). Then Sets a single purple pixel at (178, 62).
; PLAN: r0=116(x1), r1=223(y1), r2=149(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=178(x), r1=62(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (116, 223) to (149, 104).
; PLAN: r0=116(x1), r1=223(y1), r2=149(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 223
LDI r2, 149
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (178, 62).
; PLAN: r0=178(x), r1=62(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 62
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
