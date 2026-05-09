; DESCRIPTION: Draws a white line from (461, 28) to (237, 235).
; PLAN: r0=461(x1), r1=28(y1), r2=237(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 28
LDI r2, 237
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
