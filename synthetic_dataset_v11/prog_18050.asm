; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (195, 107) to (44, 246). Then Places a green dot at position (13, 55).
; PLAN: r0=195(x1), r1=107(y1), r2=44(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=13(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (195, 107) to (44, 246).
; PLAN: r0=195(x1), r1=107(y1), r2=44(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 107
LDI r2, 44
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (13, 55).
; PLAN: r0=13(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
