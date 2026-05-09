; DESCRIPTION: Places a red line segment connecting (168, 29) to (9, 141).
; PLAN: r0=168(x1), r1=29(y1), r2=9(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 29
LDI r2, 9
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
