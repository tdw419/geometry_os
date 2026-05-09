; DESCRIPTION: Draws a magenta line from (263, 101) to (245, 176).
; PLAN: r0=263(x1), r1=101(y1), r2=245(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 101
LDI r2, 245
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
