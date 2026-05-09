; DESCRIPTION: Composite: Renders a green line between points (242, 109) and (442, 1) then Sets a single white pixel at (371, 13).
; PLAN: r0=242(x1), r1=109(y1), r2=442(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=13(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 109
LDI r2, 442
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 13
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
