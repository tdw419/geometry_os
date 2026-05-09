; DESCRIPTION: Places a yellow line segment connecting (320, 205) to (424, 90).
; PLAN: r0=320(x1), r1=205(y1), r2=424(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 205
LDI r2, 424
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
