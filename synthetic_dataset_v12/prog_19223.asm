; DESCRIPTION: Renders a green line between points (58, 110) and (307, 33).
; PLAN: r0=58(x1), r1=110(y1), r2=307(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 110
LDI r2, 307
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
