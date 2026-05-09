; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (33, 209) to (20, 141). Then Places a cyan dot at position (234, 145).
; PLAN: r0=33(x1), r1=209(y1), r2=20(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=234(x), r1=145(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (33, 209) to (20, 141).
; PLAN: r0=33(x1), r1=209(y1), r2=20(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 209
LDI r2, 20
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (234, 145).
; PLAN: r0=234(x), r1=145(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 145
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
