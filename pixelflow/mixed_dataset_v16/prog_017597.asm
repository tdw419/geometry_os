; DESCRIPTION: Renders a cyan line between points (248, 33) and (19, 76).
; PLAN: r0=248(x1), r1=33(y1), r2=19(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 33
LDI r2, 19
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
