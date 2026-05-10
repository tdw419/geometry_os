; DESCRIPTION: Draws a magenta line from (368, 174) to (129, 125).
; PLAN: r0=368(x1), r1=174(y1), r2=129(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 174
LDI r2, 129
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
