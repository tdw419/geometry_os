; DESCRIPTION: Renders a cyan line between points (46, 110) and (227, 221).
; PLAN: r0=46(x1), r1=110(y1), r2=227(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 110
LDI r2, 227
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
