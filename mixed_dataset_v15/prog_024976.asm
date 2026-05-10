; DESCRIPTION: Draws a yellow line from (217, 235) to (331, 154).
; PLAN: r0=217(x1), r1=235(y1), r2=331(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 235
LDI r2, 331
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
