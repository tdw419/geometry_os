; DESCRIPTION: Places a green line segment connecting (154, 199) to (470, 33).
; PLAN: r0=154(x1), r1=199(y1), r2=470(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 199
LDI r2, 470
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
