; DESCRIPTION: Composite: . Then Places a purple line segment connecting (166, 174) to (176, 60). Then Sets a single cyan pixel at (102, 207).
; PLAN: r0=166(x1), r1=174(y1), r2=176(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=207(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (166, 174) to (176, 60).
; PLAN: r0=166(x1), r1=174(y1), r2=176(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 174
LDI r2, 176
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (102, 207).
; PLAN: r0=102(x), r1=207(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 207
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
