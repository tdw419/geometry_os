; DESCRIPTION: Draws a magenta line from (283, 175) to (150, 44).
; PLAN: r0=283(x1), r1=175(y1), r2=150(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 175
LDI r2, 150
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
