; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (235, 40) to (176, 133). Then Sets a single black pixel at (210, 194).
; PLAN: r0=235(x1), r1=40(y1), r2=176(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=210(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (235, 40) to (176, 133).
; PLAN: r0=235(x1), r1=40(y1), r2=176(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 40
LDI r2, 176
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (210, 194).
; PLAN: r0=210(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
HALT
