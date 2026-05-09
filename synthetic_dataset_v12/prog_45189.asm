; DESCRIPTION: Places a black line segment connecting (255, 174) to (181, 242).
; PLAN: r0=255(x1), r1=174(y1), r2=181(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 174
LDI r2, 181
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
