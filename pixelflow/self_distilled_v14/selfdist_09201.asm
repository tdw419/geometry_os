; DESCRIPTION: Draws a red line from (108, 70) to (296, 69).
; PLAN: r0=108(x1), r1=70(y1), r2=296(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 70
LDI r2, 296
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
