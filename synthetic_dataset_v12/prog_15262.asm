; DESCRIPTION: Places a red line segment connecting (294, 16) to (110, 249).
; PLAN: r0=294(x1), r1=16(y1), r2=110(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 16
LDI r2, 110
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
