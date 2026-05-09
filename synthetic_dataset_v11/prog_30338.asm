; DESCRIPTION: Draws a green line from (252, 8) to (116, 8).
; PLAN: r0=252(x1), r1=8(y1), r2=116(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 8
LDI r2, 116
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
