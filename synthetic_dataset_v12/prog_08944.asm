; DESCRIPTION: Places a cyan line segment connecting (312, 136) to (255, 170).
; PLAN: r0=312(x1), r1=136(y1), r2=255(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 136
LDI r2, 255
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
