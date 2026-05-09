; DESCRIPTION: Draws a white line from (56, 176) to (249, 144).
; PLAN: r0=56(x1), r1=176(y1), r2=249(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 176
LDI r2, 249
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
