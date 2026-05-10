; DESCRIPTION: Draws a blue line from (417, 56) to (187, 172).
; PLAN: r0=417(x1), r1=56(y1), r2=187(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 56
LDI r2, 187
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
