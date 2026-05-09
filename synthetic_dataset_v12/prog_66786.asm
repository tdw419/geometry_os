; DESCRIPTION: Places a red line segment connecting (300, 249) to (168, 129).
; PLAN: r0=300(x1), r1=249(y1), r2=168(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 249
LDI r2, 168
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
