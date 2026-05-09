; DESCRIPTION: Draws a magenta line from (10, 223) to (213, 122).
; PLAN: r0=10(x1), r1=223(y1), r2=213(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 223
LDI r2, 213
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
