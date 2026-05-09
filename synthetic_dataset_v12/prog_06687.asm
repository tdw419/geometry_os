; DESCRIPTION: Draws a green line from (21, 113) to (496, 3).
; PLAN: r0=21(x1), r1=113(y1), r2=496(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 113
LDI r2, 496
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
