; DESCRIPTION: Places a black line segment connecting (385, 242) to (487, 212).
; PLAN: r0=385(x1), r1=242(y1), r2=487(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 242
LDI r2, 487
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
