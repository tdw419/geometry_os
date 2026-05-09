; DESCRIPTION: Composite: . Then Places a purple line segment connecting (137, 27) to (149, 224). Then Sets a single cyan pixel at (221, 225).
; PLAN: r0=137(x1), r1=27(y1), r2=149(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=221(x), r1=225(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (137, 27) to (149, 224).
; PLAN: r0=137(x1), r1=27(y1), r2=149(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 27
LDI r2, 149
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (221, 225).
; PLAN: r0=221(x), r1=225(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 225
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
