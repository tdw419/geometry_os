; DESCRIPTION: Composite: . Then Places a cyan dot at position (245, 68). Then Places a black line segment connecting (3, 168) to (44, 195).
; PLAN: r0=245(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=3(x1), r1=168(y1), r2=44(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (245, 68).
; PLAN: r0=245(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (3, 168) to (44, 195).
; PLAN: r0=3(x1), r1=168(y1), r2=44(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 168
LDI r2, 44
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
