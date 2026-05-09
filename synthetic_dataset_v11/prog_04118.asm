; DESCRIPTION: Places a yellow line segment connecting (60, 146) to (32, 43).
; PLAN: r0=60(x1), r1=146(y1), r2=32(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 146
LDI r2, 32
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
