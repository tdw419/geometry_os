; DESCRIPTION: Draws a red line from (310, 32) to (170, 225).
; PLAN: r0=310(x1), r1=32(y1), r2=170(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 32
LDI r2, 170
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
