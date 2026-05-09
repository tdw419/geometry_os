; DESCRIPTION: Places a yellow line segment connecting (333, 12) to (329, 55).
; PLAN: r0=333(x1), r1=12(y1), r2=329(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 12
LDI r2, 329
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
