; DESCRIPTION: Places a yellow line segment connecting (239, 55) to (104, 21).
; PLAN: r0=239(x1), r1=55(y1), r2=104(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 55
LDI r2, 104
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
