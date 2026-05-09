; DESCRIPTION: Draws a yellow line from (129, 245) to (235, 27).
; PLAN: r0=129(x1), r1=245(y1), r2=235(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 245
LDI r2, 235
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
