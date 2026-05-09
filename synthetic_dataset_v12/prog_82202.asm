; DESCRIPTION: Draws a cyan line from (267, 211) to (476, 235).
; PLAN: r0=267(x1), r1=211(y1), r2=476(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 211
LDI r2, 476
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
