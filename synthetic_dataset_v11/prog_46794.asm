; DESCRIPTION: Places a red line segment connecting (202, 139) to (86, 55).
; PLAN: r0=202(x1), r1=139(y1), r2=86(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 139
LDI r2, 86
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
