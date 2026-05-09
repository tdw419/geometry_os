; DESCRIPTION: Draws a white line from (280, 206) to (235, 157).
; PLAN: r0=280(x1), r1=206(y1), r2=235(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 206
LDI r2, 235
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
