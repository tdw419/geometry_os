; DESCRIPTION: Places a black line segment connecting (68, 124) to (168, 109).
; PLAN: r0=68(x1), r1=124(y1), r2=168(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 124
LDI r2, 168
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
