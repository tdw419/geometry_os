; DESCRIPTION: Renders a cyan line between points (431, 142) and (338, 187).
; PLAN: r0=431(x1), r1=142(y1), r2=338(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 142
LDI r2, 338
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
