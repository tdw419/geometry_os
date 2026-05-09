; DESCRIPTION: Draws a magenta line from (254, 187) to (219, 107).
; PLAN: r0=254(x1), r1=187(y1), r2=219(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 187
LDI r2, 219
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
