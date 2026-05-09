; DESCRIPTION: Draws a blue line from (417, 178) to (420, 26).
; PLAN: r0=417(x1), r1=178(y1), r2=420(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 178
LDI r2, 420
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
