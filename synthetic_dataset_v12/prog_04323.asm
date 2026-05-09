; DESCRIPTION: Places a red line segment connecting (315, 74) to (272, 42).
; PLAN: r0=315(x1), r1=74(y1), r2=272(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 74
LDI r2, 272
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
