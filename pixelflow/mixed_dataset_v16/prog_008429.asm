; DESCRIPTION: Places a yellow line segment connecting (320, 109) to (415, 160).
; PLAN: r0=320(x1), r1=109(y1), r2=415(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 109
LDI r2, 415
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
