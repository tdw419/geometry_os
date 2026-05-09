; DESCRIPTION: Places a cyan line segment connecting (0, 142) to (175, 251).
; PLAN: r0=0(x1), r1=142(y1), r2=175(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 142
LDI r2, 175
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
