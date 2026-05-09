; DESCRIPTION: Draws a cyan line from (88, 44) to (98, 129).
; PLAN: r0=88(x1), r1=44(y1), r2=98(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 44
LDI r2, 98
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
