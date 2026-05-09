; DESCRIPTION: Places a black line segment connecting (214, 215) to (17, 28).
; PLAN: r0=214(x1), r1=215(y1), r2=17(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 215
LDI r2, 17
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
