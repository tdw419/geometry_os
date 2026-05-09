; DESCRIPTION: Places a yellow line segment connecting (116, 205) to (417, 68).
; PLAN: r0=116(x1), r1=205(y1), r2=417(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 205
LDI r2, 417
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
