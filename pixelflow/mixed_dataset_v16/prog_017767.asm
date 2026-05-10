; DESCRIPTION: Places a black line segment connecting (280, 242) to (122, 156).
; PLAN: r0=280(x1), r1=242(y1), r2=122(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 242
LDI r2, 122
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
