; DESCRIPTION: Places a cyan line segment connecting (440, 232) to (60, 17).
; PLAN: r0=440(x1), r1=232(y1), r2=60(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 232
LDI r2, 60
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
