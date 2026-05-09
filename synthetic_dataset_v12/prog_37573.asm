; DESCRIPTION: Draws a red line from (110, 38) to (206, 29).
; PLAN: r0=110(x1), r1=38(y1), r2=206(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 38
LDI r2, 206
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
