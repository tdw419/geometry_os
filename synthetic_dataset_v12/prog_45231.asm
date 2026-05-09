; DESCRIPTION: Places a green line segment connecting (87, 149) to (439, 187).
; PLAN: r0=87(x1), r1=149(y1), r2=439(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 149
LDI r2, 439
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
