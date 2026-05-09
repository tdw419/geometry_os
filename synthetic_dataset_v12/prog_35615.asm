; DESCRIPTION: Places a green line segment connecting (375, 154) to (59, 0).
; PLAN: r0=375(x1), r1=154(y1), r2=59(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 154
LDI r2, 59
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
