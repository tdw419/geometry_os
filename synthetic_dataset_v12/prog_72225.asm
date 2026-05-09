; DESCRIPTION: Places a red line segment connecting (376, 97) to (470, 42).
; PLAN: r0=376(x1), r1=97(y1), r2=470(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 97
LDI r2, 470
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
