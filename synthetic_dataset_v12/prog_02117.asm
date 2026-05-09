; DESCRIPTION: Places a white line segment connecting (36, 173) to (455, 55).
; PLAN: r0=36(x1), r1=173(y1), r2=455(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 173
LDI r2, 455
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
