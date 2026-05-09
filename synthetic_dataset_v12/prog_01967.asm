; DESCRIPTION: Draws a red line from (137, 40) to (173, 38).
; PLAN: r0=137(x1), r1=40(y1), r2=173(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 40
LDI r2, 173
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
