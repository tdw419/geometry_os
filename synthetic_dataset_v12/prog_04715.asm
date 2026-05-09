; DESCRIPTION: Places a black line segment connecting (295, 39) to (64, 129).
; PLAN: r0=295(x1), r1=39(y1), r2=64(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 39
LDI r2, 64
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
