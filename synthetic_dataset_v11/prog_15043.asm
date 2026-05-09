; DESCRIPTION: Draws a white line from (96, 79) to (235, 148).
; PLAN: r0=96(x1), r1=79(y1), r2=235(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 79
LDI r2, 235
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
