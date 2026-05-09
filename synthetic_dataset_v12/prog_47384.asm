; DESCRIPTION: Places a white line segment connecting (59, 91) to (210, 99).
; PLAN: r0=59(x1), r1=91(y1), r2=210(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 91
LDI r2, 210
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
