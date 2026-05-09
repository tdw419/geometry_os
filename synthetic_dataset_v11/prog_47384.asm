; DESCRIPTION: Draws a green line from (194, 173) to (55, 66).
; PLAN: r0=194(x1), r1=173(y1), r2=55(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 173
LDI r2, 55
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
