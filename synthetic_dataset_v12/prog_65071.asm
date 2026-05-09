; DESCRIPTION: Places a black line segment connecting (346, 19) to (25, 56).
; PLAN: r0=346(x1), r1=19(y1), r2=25(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 19
LDI r2, 25
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
