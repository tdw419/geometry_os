; DESCRIPTION: Places a black line segment connecting (69, 173) to (117, 78).
; PLAN: r0=69(x1), r1=173(y1), r2=117(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 173
LDI r2, 117
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
