; DESCRIPTION: Places a cyan line segment connecting (456, 201) to (220, 240).
; PLAN: r0=456(x1), r1=201(y1), r2=220(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 201
LDI r2, 220
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
