; DESCRIPTION: Places a cyan line segment connecting (83, 49) to (240, 226).
; PLAN: r0=83(x1), r1=49(y1), r2=240(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 49
LDI r2, 240
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
