; DESCRIPTION: Composite: . Then Sets a single orange pixel at (249, 156). Then Places a blue line segment connecting (228, 110) to (22, 223).
; PLAN: r0=249(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=228(x1), r1=110(y1), r2=22(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (249, 156).
; PLAN: r0=249(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 156
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (228, 110) to (22, 223).
; PLAN: r0=228(x1), r1=110(y1), r2=22(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 110
LDI r2, 22
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
