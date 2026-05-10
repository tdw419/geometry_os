; DESCRIPTION: Composite: Renders a purple line between points (487, 128) and (105, 242) then Sets a single red pixel at (371, 36).
; PLAN: r0=487(x1), r1=128(y1), r2=105(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=36(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 487
LDI r1, 128
LDI r2, 105
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 36
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
