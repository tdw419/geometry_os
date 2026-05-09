; DESCRIPTION: Draws a magenta line from (372, 54) to (44, 5).
; PLAN: r0=372(x1), r1=54(y1), r2=44(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 54
LDI r2, 44
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
