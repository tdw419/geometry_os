; DESCRIPTION: Places a yellow line segment connecting (298, 113) to (114, 233).
; PLAN: r0=298(x1), r1=113(y1), r2=114(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 113
LDI r2, 114
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
