; DESCRIPTION: Draws a green line from (157, 44) to (170, 4).
; PLAN: r0=157(x1), r1=44(y1), r2=170(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 44
LDI r2, 170
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
