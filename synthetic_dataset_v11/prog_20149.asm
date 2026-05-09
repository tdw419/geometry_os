; DESCRIPTION: Draws a magenta line from (234, 30) to (115, 125).
; PLAN: r0=234(x1), r1=30(y1), r2=115(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 30
LDI r2, 115
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
