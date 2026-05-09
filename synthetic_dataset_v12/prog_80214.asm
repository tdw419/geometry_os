; DESCRIPTION: Places a yellow line segment connecting (298, 21) to (73, 70).
; PLAN: r0=298(x1), r1=21(y1), r2=73(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 21
LDI r2, 73
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
