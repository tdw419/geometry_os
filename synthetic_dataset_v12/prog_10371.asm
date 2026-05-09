; DESCRIPTION: Draws a red line from (141, 69) to (398, 2).
; PLAN: r0=141(x1), r1=69(y1), r2=398(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 69
LDI r2, 398
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
