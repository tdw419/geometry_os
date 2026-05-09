; DESCRIPTION: Draws a magenta line from (125, 1) to (66, 32).
; PLAN: r0=125(x1), r1=1(y1), r2=66(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 1
LDI r2, 66
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
