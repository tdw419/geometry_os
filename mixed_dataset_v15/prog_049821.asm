; DESCRIPTION: Places a red line segment connecting (137, 214) to (113, 123).
; PLAN: r0=137(x1), r1=214(y1), r2=113(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 214
LDI r2, 113
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
