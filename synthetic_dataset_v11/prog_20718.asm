; DESCRIPTION: Places a cyan line segment connecting (57, 75) to (240, 254).
; PLAN: r0=57(x1), r1=75(y1), r2=240(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 75
LDI r2, 240
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
