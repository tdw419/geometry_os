; DESCRIPTION: Draws a magenta line from (39, 26) to (233, 197).
; PLAN: r0=39(x1), r1=26(y1), r2=233(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 26
LDI r2, 233
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
