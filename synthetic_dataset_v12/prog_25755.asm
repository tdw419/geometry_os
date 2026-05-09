; DESCRIPTION: Places a green line segment connecting (340, 57) to (38, 101).
; PLAN: r0=340(x1), r1=57(y1), r2=38(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 57
LDI r2, 38
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
