; DESCRIPTION: Draws a magenta line from (265, 159) to (186, 248).
; PLAN: r0=265(x1), r1=159(y1), r2=186(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 159
LDI r2, 186
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
