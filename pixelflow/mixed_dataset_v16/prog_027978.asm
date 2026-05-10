; DESCRIPTION: Draws a black line from (81, 224) to (64, 82).
; PLAN: r0=81(x1), r1=224(y1), r2=64(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 224
LDI r2, 64
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
