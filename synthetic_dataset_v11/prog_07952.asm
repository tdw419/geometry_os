; DESCRIPTION: Places a green line segment connecting (229, 164) to (91, 55).
; PLAN: r0=229(x1), r1=164(y1), r2=91(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 164
LDI r2, 91
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
