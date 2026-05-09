; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (0, 4) to (215, 44). Then Sets a single green pixel at (193, 237).
; PLAN: r0=0(x1), r1=4(y1), r2=215(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=193(x), r1=237(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (0, 4) to (215, 44).
; PLAN: r0=0(x1), r1=4(y1), r2=215(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 4
LDI r2, 215
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (193, 237).
; PLAN: r0=193(x), r1=237(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 237
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
