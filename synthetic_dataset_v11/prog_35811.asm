; DESCRIPTION: Draws a yellow line from (194, 165) to (82, 220).
; PLAN: r0=194(x1), r1=165(y1), r2=82(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 165
LDI r2, 82
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
