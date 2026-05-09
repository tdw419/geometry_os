; DESCRIPTION: Places a white line segment connecting (153, 220) to (12, 32).
; PLAN: r0=153(x1), r1=220(y1), r2=12(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 220
LDI r2, 12
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
