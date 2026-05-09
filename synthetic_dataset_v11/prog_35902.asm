; DESCRIPTION: Draws a black line from (247, 224) to (199, 195).
; PLAN: r0=247(x1), r1=224(y1), r2=199(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 224
LDI r2, 199
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
