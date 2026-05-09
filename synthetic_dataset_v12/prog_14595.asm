; DESCRIPTION: Draws a green line from (191, 194) to (498, 140).
; PLAN: r0=191(x1), r1=194(y1), r2=498(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 194
LDI r2, 498
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
