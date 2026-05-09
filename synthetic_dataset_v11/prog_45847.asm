; DESCRIPTION: Draws a green line from (233, 223) to (89, 192).
; PLAN: r0=233(x1), r1=223(y1), r2=89(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 223
LDI r2, 89
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
