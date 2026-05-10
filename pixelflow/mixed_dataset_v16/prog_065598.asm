; DESCRIPTION: Draws a green line from (212, 156) to (320, 117).
; PLAN: r0=212(x1), r1=156(y1), r2=320(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 156
LDI r2, 320
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
