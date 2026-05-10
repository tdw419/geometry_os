; DESCRIPTION: Draws a green line from (17, 174) to (352, 38).
; PLAN: r0=17(x1), r1=174(y1), r2=352(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 174
LDI r2, 352
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
