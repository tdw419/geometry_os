; DESCRIPTION: Draws a magenta line from (125, 83) to (130, 142).
; PLAN: r0=125(x1), r1=83(y1), r2=130(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 83
LDI r2, 130
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
