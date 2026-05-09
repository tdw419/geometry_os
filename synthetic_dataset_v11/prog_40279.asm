; DESCRIPTION: Places a cyan line segment connecting (137, 146) to (54, 88).
; PLAN: r0=137(x1), r1=146(y1), r2=54(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 146
LDI r2, 54
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
