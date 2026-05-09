; DESCRIPTION: Places a red line segment connecting (128, 189) to (268, 207).
; PLAN: r0=128(x1), r1=189(y1), r2=268(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 189
LDI r2, 268
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
