; DESCRIPTION: Renders a magenta line between points (275, 187) and (273, 121).
; PLAN: r0=275(x1), r1=187(y1), r2=273(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 187
LDI r2, 273
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
