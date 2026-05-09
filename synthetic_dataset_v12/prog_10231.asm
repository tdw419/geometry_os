; DESCRIPTION: Draws a red line from (352, 223) to (279, 136).
; PLAN: r0=352(x1), r1=223(y1), r2=279(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 223
LDI r2, 279
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
