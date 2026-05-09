; DESCRIPTION: Renders a magenta line between points (236, 192) and (418, 235).
; PLAN: r0=236(x1), r1=192(y1), r2=418(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 192
LDI r2, 418
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
