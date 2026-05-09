; DESCRIPTION: Draws a magenta line from (138, 224) to (233, 186).
; PLAN: r0=138(x1), r1=224(y1), r2=233(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 224
LDI r2, 233
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
