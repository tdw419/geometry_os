; DESCRIPTION: Places a cyan line segment connecting (300, 175) to (473, 45).
; PLAN: r0=300(x1), r1=175(y1), r2=473(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 175
LDI r2, 473
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
