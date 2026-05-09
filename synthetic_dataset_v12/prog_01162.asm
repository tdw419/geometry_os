; DESCRIPTION: Places a red line segment connecting (320, 17) to (66, 31).
; PLAN: r0=320(x1), r1=17(y1), r2=66(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 17
LDI r2, 66
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
