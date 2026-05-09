; DESCRIPTION: Places a yellow line segment connecting (96, 226) to (380, 2).
; PLAN: r0=96(x1), r1=226(y1), r2=380(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 226
LDI r2, 380
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
