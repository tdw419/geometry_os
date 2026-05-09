; DESCRIPTION: Composite: . Then Sets a single orange pixel at (206, 82). Then Places a black line segment connecting (77, 189) to (103, 229).
; PLAN: r0=206(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=77(x1), r1=189(y1), r2=103(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (206, 82).
; PLAN: r0=206(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (77, 189) to (103, 229).
; PLAN: r0=77(x1), r1=189(y1), r2=103(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 189
LDI r2, 103
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
