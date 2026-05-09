; DESCRIPTION: Composite: . Then Places a red dot at position (48, 10). Then Places a red line segment connecting (26, 230) to (250, 240).
; PLAN: r0=48(x), r1=10(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=26(x1), r1=230(y1), r2=250(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (48, 10).
; PLAN: r0=48(x), r1=10(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 10
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (26, 230) to (250, 240).
; PLAN: r0=26(x1), r1=230(y1), r2=250(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 230
LDI r2, 250
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
