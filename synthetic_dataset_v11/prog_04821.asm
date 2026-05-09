; DESCRIPTION: Composite: . Then Places a white line segment connecting (223, 87) to (74, 170). Then Places a black dot at position (237, 246).
; PLAN: r0=223(x1), r1=87(y1), r2=74(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=237(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (223, 87) to (74, 170).
; PLAN: r0=223(x1), r1=87(y1), r2=74(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 87
LDI r2, 74
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (237, 246).
; PLAN: r0=237(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
HALT
