; DESCRIPTION: Draws a green line from (172, 113) to (391, 6).
; PLAN: r0=172(x1), r1=113(y1), r2=391(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 113
LDI r2, 391
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
