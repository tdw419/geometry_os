; DESCRIPTION: Places a cyan line segment connecting (91, 107) to (109, 149).
; PLAN: r0=91(x1), r1=107(y1), r2=109(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 107
LDI r2, 109
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
