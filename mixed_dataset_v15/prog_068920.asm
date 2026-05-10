; DESCRIPTION: Draws a green line from (93, 129) to (77, 33).
; PLAN: r0=93(x1), r1=129(y1), r2=77(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 129
LDI r2, 77
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
