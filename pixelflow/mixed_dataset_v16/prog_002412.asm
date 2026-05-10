; DESCRIPTION: Places a yellow line segment connecting (272, 90) to (109, 42).
; PLAN: r0=272(x1), r1=90(y1), r2=109(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 90
LDI r2, 109
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
