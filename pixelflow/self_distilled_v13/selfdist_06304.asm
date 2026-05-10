; DESCRIPTION: Draws a yellow line from (287, 116) to (352, 48).
; PLAN: r0=287(x1), r1=116(y1), r2=352(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 116
LDI r2, 352
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
