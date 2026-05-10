; DESCRIPTION: Draws a red line from (50, 254) to (244, 180).
; PLAN: r0=50(x1), r1=254(y1), r2=244(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 254
LDI r2, 244
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
