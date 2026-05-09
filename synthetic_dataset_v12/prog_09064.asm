; DESCRIPTION: Places a green line segment connecting (83, 9) to (208, 146).
; PLAN: r0=83(x1), r1=9(y1), r2=208(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 9
LDI r2, 208
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
