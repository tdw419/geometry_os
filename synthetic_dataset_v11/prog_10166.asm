; DESCRIPTION: Places a red line segment connecting (175, 98) to (202, 207).
; PLAN: r0=175(x1), r1=98(y1), r2=202(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 98
LDI r2, 202
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
