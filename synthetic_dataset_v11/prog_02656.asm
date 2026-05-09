; DESCRIPTION: Places a red line segment connecting (104, 54) to (42, 98).
; PLAN: r0=104(x1), r1=54(y1), r2=42(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 54
LDI r2, 42
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
