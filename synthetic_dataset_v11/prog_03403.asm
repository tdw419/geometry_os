; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (140, 106) to (191, 107). Then Sets a single orange pixel at (22, 128).
; PLAN: r0=140(x1), r1=106(y1), r2=191(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=22(x), r1=128(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (140, 106) to (191, 107).
; PLAN: r0=140(x1), r1=106(y1), r2=191(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 106
LDI r2, 191
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (22, 128).
; PLAN: r0=22(x), r1=128(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 128
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
