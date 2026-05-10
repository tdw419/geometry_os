; DESCRIPTION: Places a black line segment connecting (365, 177) to (416, 76).
; PLAN: r0=365(x1), r1=177(y1), r2=416(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 177
LDI r2, 416
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
