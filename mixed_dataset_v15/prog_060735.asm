; DESCRIPTION: Draws a green line from (191, 47) to (366, 241).
; PLAN: r0=191(x1), r1=47(y1), r2=366(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 47
LDI r2, 366
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
