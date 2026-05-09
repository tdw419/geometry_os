; DESCRIPTION: Places a cyan line segment connecting (175, 125) to (247, 217).
; PLAN: r0=175(x1), r1=125(y1), r2=247(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 125
LDI r2, 247
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
