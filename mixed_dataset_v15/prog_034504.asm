; DESCRIPTION: Draws a magenta line from (196, 44) to (296, 240).
; PLAN: r0=196(x1), r1=44(y1), r2=296(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 44
LDI r2, 296
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
