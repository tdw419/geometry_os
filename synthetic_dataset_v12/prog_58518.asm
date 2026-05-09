; DESCRIPTION: Renders a cyan line between points (463, 244) and (431, 58).
; PLAN: r0=463(x1), r1=244(y1), r2=431(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 244
LDI r2, 431
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
