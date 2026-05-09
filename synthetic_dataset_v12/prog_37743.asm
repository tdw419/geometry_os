; DESCRIPTION: Draws a red line from (46, 239) to (489, 78).
; PLAN: r0=46(x1), r1=239(y1), r2=489(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 239
LDI r2, 489
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
