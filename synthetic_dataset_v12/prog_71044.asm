; DESCRIPTION: Draws a magenta line from (192, 237) to (285, 186).
; PLAN: r0=192(x1), r1=237(y1), r2=285(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 237
LDI r2, 285
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
