; DESCRIPTION: Renders a green line between points (497, 47) and (31, 32).
; PLAN: r0=497(x1), r1=47(y1), r2=31(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 47
LDI r2, 31
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
