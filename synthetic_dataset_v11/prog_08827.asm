; DESCRIPTION: Places a green line segment connecting (146, 204) to (17, 212).
; PLAN: r0=146(x1), r1=204(y1), r2=17(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 204
LDI r2, 17
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
