; DESCRIPTION: Draws a blue line from (143, 124) to (218, 235).
; PLAN: r0=143(x1), r1=124(y1), r2=218(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 124
LDI r2, 218
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
