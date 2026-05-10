; DESCRIPTION: Places a cyan line segment connecting (146, 227) to (137, 65).
; PLAN: r0=146(x1), r1=227(y1), r2=137(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 227
LDI r2, 137
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
