; DESCRIPTION: Places a white line segment connecting (272, 234) to (279, 108).
; PLAN: r0=272(x1), r1=234(y1), r2=279(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 234
LDI r2, 279
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
