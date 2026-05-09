; DESCRIPTION: Draws a red line from (507, 38) to (295, 2).
; PLAN: r0=507(x1), r1=38(y1), r2=295(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 38
LDI r2, 295
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
