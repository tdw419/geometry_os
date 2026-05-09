; DESCRIPTION: Renders a magenta line between points (187, 205) and (409, 110).
; PLAN: r0=187(x1), r1=205(y1), r2=409(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 205
LDI r2, 409
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
