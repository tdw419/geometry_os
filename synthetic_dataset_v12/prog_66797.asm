; DESCRIPTION: Draws a magenta line from (210, 139) to (438, 44).
; PLAN: r0=210(x1), r1=139(y1), r2=438(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 139
LDI r2, 438
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
