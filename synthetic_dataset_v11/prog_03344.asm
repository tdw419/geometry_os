; DESCRIPTION: Draws a cyan line from (235, 87) to (77, 157).
; PLAN: r0=235(x1), r1=87(y1), r2=77(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 87
LDI r2, 77
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
