; DESCRIPTION: Draws a green line from (290, 46) to (409, 112).
; PLAN: r0=290(x1), r1=46(y1), r2=409(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 46
LDI r2, 409
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
