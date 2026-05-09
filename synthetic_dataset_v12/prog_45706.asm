; DESCRIPTION: Draws a magenta line from (269, 19) to (467, 3).
; PLAN: r0=269(x1), r1=19(y1), r2=467(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 19
LDI r2, 467
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
