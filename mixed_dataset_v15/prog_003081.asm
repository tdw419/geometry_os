; DESCRIPTION: Draws a white line from (235, 80) to (365, 95).
; PLAN: r0=235(x1), r1=80(y1), r2=365(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 80
LDI r2, 365
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
