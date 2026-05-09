; DESCRIPTION: Draws a green line from (456, 211) to (194, 66).
; PLAN: r0=456(x1), r1=211(y1), r2=194(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 211
LDI r2, 194
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
