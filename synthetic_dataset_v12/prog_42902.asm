; DESCRIPTION: Draws a green line from (475, 177) to (223, 45).
; PLAN: r0=475(x1), r1=177(y1), r2=223(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 177
LDI r2, 223
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
