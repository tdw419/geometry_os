; DESCRIPTION: Draws a green line from (16, 116) to (414, 212).
; PLAN: r0=16(x1), r1=116(y1), r2=414(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 116
LDI r2, 414
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
