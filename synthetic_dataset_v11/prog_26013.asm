; DESCRIPTION: Composite: . Then Sets a single green pixel at (195, 151). Then Draws a yellow line from (26, 110) to (128, 8).
; PLAN: r0=195(x), r1=151(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=26(x1), r1=110(y1), r2=128(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (195, 151).
; PLAN: r0=195(x), r1=151(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 151
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (26, 110) to (128, 8).
; PLAN: r0=26(x1), r1=110(y1), r2=128(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 110
LDI r2, 128
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
