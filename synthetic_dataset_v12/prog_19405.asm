; DESCRIPTION: Places a cyan line segment connecting (250, 1) to (381, 226).
; PLAN: r0=250(x1), r1=1(y1), r2=381(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 1
LDI r2, 381
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
