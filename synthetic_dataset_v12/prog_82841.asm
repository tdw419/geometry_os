; DESCRIPTION: Draws a cyan line from (474, 226) to (119, 235).
; PLAN: r0=474(x1), r1=226(y1), r2=119(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 226
LDI r2, 119
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
