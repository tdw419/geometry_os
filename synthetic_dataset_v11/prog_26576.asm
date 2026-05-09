; DESCRIPTION: Places a red line segment connecting (87, 216) to (168, 43).
; PLAN: r0=87(x1), r1=216(y1), r2=168(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 216
LDI r2, 168
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
