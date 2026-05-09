; DESCRIPTION: Places a black line segment connecting (255, 27) to (175, 13).
; PLAN: r0=255(x1), r1=27(y1), r2=175(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 27
LDI r2, 175
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
