; DESCRIPTION: Places a white line segment connecting (400, 216) to (168, 246).
; PLAN: r0=400(x1), r1=216(y1), r2=168(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 216
LDI r2, 168
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
