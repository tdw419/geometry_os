; DESCRIPTION: Draws a green line from (73, 251) to (98, 83).
; PLAN: r0=73(x1), r1=251(y1), r2=98(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 251
LDI r2, 98
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
