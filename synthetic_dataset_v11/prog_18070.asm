; DESCRIPTION: Draws a yellow line from (174, 106) to (126, 202).
; PLAN: r0=174(x1), r1=106(y1), r2=126(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 106
LDI r2, 126
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
