; DESCRIPTION: Places a yellow line segment connecting (193, 146) to (57, 98).
; PLAN: r0=193(x1), r1=146(y1), r2=57(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 146
LDI r2, 57
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
