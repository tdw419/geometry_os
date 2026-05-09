; DESCRIPTION: Places a yellow line segment connecting (509, 141) to (480, 40).
; PLAN: r0=509(x1), r1=141(y1), r2=480(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 141
LDI r2, 480
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
