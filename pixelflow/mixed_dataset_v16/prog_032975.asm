; DESCRIPTION: Places a yellow line segment connecting (275, 133) to (295, 104).
; PLAN: r0=275(x1), r1=133(y1), r2=295(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 133
LDI r2, 295
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
