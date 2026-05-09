; DESCRIPTION: Renders a yellow line between points (497, 235) and (248, 236).
; PLAN: r0=497(x1), r1=235(y1), r2=248(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 235
LDI r2, 248
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
