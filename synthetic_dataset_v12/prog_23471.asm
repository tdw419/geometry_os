; DESCRIPTION: Places a cyan line segment connecting (175, 57) to (197, 102).
; PLAN: r0=175(x1), r1=57(y1), r2=197(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 57
LDI r2, 197
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
