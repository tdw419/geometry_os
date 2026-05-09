; DESCRIPTION: Places a black line segment connecting (337, 114) to (410, 34).
; PLAN: r0=337(x1), r1=114(y1), r2=410(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 114
LDI r2, 410
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
