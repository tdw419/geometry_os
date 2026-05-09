; DESCRIPTION: Composite: . Then Places a black dot at position (174, 5). Then Renders a cyan line between points (185, 148) and (229, 236).
; PLAN: r0=174(x), r1=5(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=185(x1), r1=148(y1), r2=229(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (174, 5).
; PLAN: r0=174(x), r1=5(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 5
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (185, 148) and (229, 236).
; PLAN: r0=185(x1), r1=148(y1), r2=229(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 148
LDI r2, 229
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
