; DESCRIPTION: Draws a cyan line from (194, 54) to (235, 178).
; PLAN: r0=194(x1), r1=54(y1), r2=235(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 54
LDI r2, 235
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
