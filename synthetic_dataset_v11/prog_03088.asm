; DESCRIPTION: Draws a magenta line from (116, 244) to (241, 15).
; PLAN: r0=116(x1), r1=244(y1), r2=241(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 244
LDI r2, 241
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
