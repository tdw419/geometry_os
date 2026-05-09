; DESCRIPTION: Renders a cyan line between points (137, 69) and (54, 22).
; PLAN: r0=137(x1), r1=69(y1), r2=54(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 69
LDI r2, 54
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
