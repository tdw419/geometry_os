; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (207, 21). Then Places a green line segment connecting (164, 245) to (159, 138).
; PLAN: r0=207(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=164(x1), r1=245(y1), r2=159(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (207, 21).
; PLAN: r0=207(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a green line segment connecting (164, 245) to (159, 138).
; PLAN: r0=164(x1), r1=245(y1), r2=159(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 245
LDI r2, 159
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
