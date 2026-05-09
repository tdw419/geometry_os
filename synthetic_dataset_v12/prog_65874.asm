; DESCRIPTION: Draws a red line from (22, 180) to (160, 187).
; PLAN: r0=22(x1), r1=180(y1), r2=160(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 180
LDI r2, 160
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
