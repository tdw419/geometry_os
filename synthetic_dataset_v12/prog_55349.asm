; DESCRIPTION: Places a cyan line segment connecting (424, 44) to (454, 227).
; PLAN: r0=424(x1), r1=44(y1), r2=454(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 44
LDI r2, 454
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
