; DESCRIPTION: Places a cyan line segment connecting (13, 173) to (455, 201).
; PLAN: r0=13(x1), r1=173(y1), r2=455(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 173
LDI r2, 455
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
