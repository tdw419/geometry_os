; DESCRIPTION: Places a green line segment connecting (334, 82) to (11, 59).
; PLAN: r0=334(x1), r1=82(y1), r2=11(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 82
LDI r2, 11
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
