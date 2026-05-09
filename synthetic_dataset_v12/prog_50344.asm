; DESCRIPTION: Draws a red line from (59, 62) to (352, 200).
; PLAN: r0=59(x1), r1=62(y1), r2=352(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 62
LDI r2, 352
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
