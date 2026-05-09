; DESCRIPTION: Places a black line segment connecting (320, 50) to (289, 0).
; PLAN: r0=320(x1), r1=50(y1), r2=289(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 50
LDI r2, 289
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
