; DESCRIPTION: Places a white line segment connecting (73, 98) to (65, 101).
; PLAN: r0=73(x1), r1=98(y1), r2=65(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 98
LDI r2, 65
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
