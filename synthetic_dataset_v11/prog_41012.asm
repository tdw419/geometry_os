; DESCRIPTION: Places a cyan line segment connecting (125, 181) to (241, 129).
; PLAN: r0=125(x1), r1=181(y1), r2=241(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 181
LDI r2, 241
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
