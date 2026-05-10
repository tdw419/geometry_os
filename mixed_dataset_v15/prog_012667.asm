; DESCRIPTION: Places a cyan line segment connecting (17, 7) to (371, 136).
; PLAN: r0=17(x1), r1=7(y1), r2=371(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 7
LDI r2, 371
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
