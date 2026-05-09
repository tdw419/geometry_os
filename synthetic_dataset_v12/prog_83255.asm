; DESCRIPTION: Draws a magenta line from (438, 174) to (28, 107).
; PLAN: r0=438(x1), r1=174(y1), r2=28(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 174
LDI r2, 28
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
