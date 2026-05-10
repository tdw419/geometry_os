; DESCRIPTION: Draws a green line from (287, 165) to (211, 125).
; PLAN: r0=287(x1), r1=165(y1), r2=211(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 165
LDI r2, 211
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
