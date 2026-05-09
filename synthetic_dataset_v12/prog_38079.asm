; DESCRIPTION: Places a white line segment connecting (450, 23) to (108, 165).
; PLAN: r0=450(x1), r1=23(y1), r2=108(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 23
LDI r2, 108
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
