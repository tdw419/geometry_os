; DESCRIPTION: Places a yellow line segment connecting (352, 125) to (52, 206).
; PLAN: r0=352(x1), r1=125(y1), r2=52(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 125
LDI r2, 52
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
