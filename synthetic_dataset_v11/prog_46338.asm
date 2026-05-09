; DESCRIPTION: Places a black line segment connecting (38, 129) to (255, 255).
; PLAN: r0=38(x1), r1=129(y1), r2=255(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 129
LDI r2, 255
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
