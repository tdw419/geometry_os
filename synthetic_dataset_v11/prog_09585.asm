; DESCRIPTION: Places a black line segment connecting (168, 117) to (190, 102).
; PLAN: r0=168(x1), r1=117(y1), r2=190(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 117
LDI r2, 190
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
