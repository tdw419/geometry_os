; DESCRIPTION: Places a white line segment connecting (185, 25) to (168, 148).
; PLAN: r0=185(x1), r1=25(y1), r2=168(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 25
LDI r2, 168
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
