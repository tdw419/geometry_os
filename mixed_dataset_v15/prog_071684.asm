; DESCRIPTION: Draws a green line from (347, 165) to (414, 200).
; PLAN: r0=347(x1), r1=165(y1), r2=414(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 165
LDI r2, 414
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
