; DESCRIPTION: Places a black line segment connecting (340, 32) to (208, 178).
; PLAN: r0=340(x1), r1=32(y1), r2=208(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 32
LDI r2, 208
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
