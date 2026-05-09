; DESCRIPTION: Places a cyan line segment connecting (65, 28) to (248, 88).
; PLAN: r0=65(x1), r1=28(y1), r2=248(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 28
LDI r2, 248
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
