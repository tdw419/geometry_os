; DESCRIPTION: Places a red line segment connecting (81, 225) to (333, 14).
; PLAN: r0=81(x1), r1=225(y1), r2=333(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 225
LDI r2, 333
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
