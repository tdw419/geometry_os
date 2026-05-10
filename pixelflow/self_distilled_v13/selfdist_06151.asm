; DESCRIPTION: Draws a magenta line from (241, 141) to (283, 67).
; PLAN: r0=241(x1), r1=141(y1), r2=283(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 141
LDI r2, 283
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
