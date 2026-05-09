; DESCRIPTION: Composite: . Then Places a cyan dot at position (131, 250). Then Renders a black line between points (152, 194) and (0, 25).
; PLAN: r0=131(x), r1=250(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=152(x1), r1=194(y1), r2=0(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (131, 250).
; PLAN: r0=131(x), r1=250(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 250
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a black line between points (152, 194) and (0, 25).
; PLAN: r0=152(x1), r1=194(y1), r2=0(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 194
LDI r2, 0
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
