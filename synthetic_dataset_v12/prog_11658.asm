; DESCRIPTION: Draws a white line from (406, 191) to (256, 199).
; PLAN: r0=406(x1), r1=191(y1), r2=256(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 191
LDI r2, 256
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
