; DESCRIPTION: Places a blue line segment connecting (98, 33) to (170, 42).
; PLAN: r0=98(x1), r1=33(y1), r2=170(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 33
LDI r2, 170
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
