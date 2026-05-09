; DESCRIPTION: Places a cyan line segment connecting (93, 60) to (416, 169).
; PLAN: r0=93(x1), r1=60(y1), r2=416(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 60
LDI r2, 416
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
