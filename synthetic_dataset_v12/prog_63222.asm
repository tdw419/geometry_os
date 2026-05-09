; DESCRIPTION: Places a red line segment connecting (347, 104) to (42, 32).
; PLAN: r0=347(x1), r1=104(y1), r2=42(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 104
LDI r2, 42
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
