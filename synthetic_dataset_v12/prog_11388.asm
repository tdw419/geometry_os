; DESCRIPTION: Draws a magenta line from (187, 15) to (438, 38).
; PLAN: r0=187(x1), r1=15(y1), r2=438(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 15
LDI r2, 438
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
