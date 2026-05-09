; DESCRIPTION: Places a red line segment connecting (301, 208) to (280, 32).
; PLAN: r0=301(x1), r1=208(y1), r2=280(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 208
LDI r2, 280
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
