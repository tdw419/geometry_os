; DESCRIPTION: Draws a green line from (332, 85) to (287, 27).
; PLAN: r0=332(x1), r1=85(y1), r2=287(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 85
LDI r2, 287
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
