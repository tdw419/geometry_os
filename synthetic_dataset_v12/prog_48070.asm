; DESCRIPTION: Places a black line segment connecting (70, 239) to (191, 255).
; PLAN: r0=70(x1), r1=239(y1), r2=191(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 239
LDI r2, 191
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
