; DESCRIPTION: Places a green line segment connecting (165, 205) to (170, 247).
; PLAN: r0=165(x1), r1=205(y1), r2=170(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 205
LDI r2, 170
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
