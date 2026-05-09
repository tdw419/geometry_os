; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (210, 237) to (80, 255). Then Sets a single yellow pixel at (208, 222).
; PLAN: r0=210(x1), r1=237(y1), r2=80(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=208(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (210, 237) to (80, 255).
; PLAN: r0=210(x1), r1=237(y1), r2=80(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 237
LDI r2, 80
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (208, 222).
; PLAN: r0=208(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 222
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
