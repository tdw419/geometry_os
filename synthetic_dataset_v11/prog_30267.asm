; DESCRIPTION: Places a red line segment connecting (212, 38) to (3, 215).
; PLAN: r0=212(x1), r1=38(y1), r2=3(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 38
LDI r2, 3
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
