; DESCRIPTION: Draws a yellow line from (352, 18) to (330, 39).
; PLAN: r0=352(x1), r1=18(y1), r2=330(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 18
LDI r2, 330
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
