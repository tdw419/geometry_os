; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (115, 156) to (177, 177). Then Places a orange dot at position (223, 45).
; PLAN: r0=115(x1), r1=156(y1), r2=177(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=223(x), r1=45(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (115, 156) to (177, 177).
; PLAN: r0=115(x1), r1=156(y1), r2=177(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 156
LDI r2, 177
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (223, 45).
; PLAN: r0=223(x), r1=45(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 45
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
