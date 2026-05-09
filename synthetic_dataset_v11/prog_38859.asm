; DESCRIPTION: Places a black line segment connecting (207, 157) to (214, 16).
; PLAN: r0=207(x1), r1=157(y1), r2=214(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 157
LDI r2, 214
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
