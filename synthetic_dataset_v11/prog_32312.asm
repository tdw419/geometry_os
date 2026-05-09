; DESCRIPTION: Places a black line segment connecting (17, 35) to (171, 59).
; PLAN: r0=17(x1), r1=35(y1), r2=171(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 35
LDI r2, 171
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
