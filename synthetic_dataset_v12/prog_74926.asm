; DESCRIPTION: Draws a red line from (164, 139) to (76, 178).
; PLAN: r0=164(x1), r1=139(y1), r2=76(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 139
LDI r2, 76
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
