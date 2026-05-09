; DESCRIPTION: Renders a black line between points (300, 224) and (294, 132).
; PLAN: r0=300(x1), r1=224(y1), r2=294(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 224
LDI r2, 294
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
