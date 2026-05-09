; DESCRIPTION: Composite: Renders a blue line between points (76, 1) and (325, 133) then Places a yellow dot at position (420, 28).
; PLAN: r0=76(x1), r1=1(y1), r2=325(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=28(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 76
LDI r1, 1
LDI r2, 325
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 28
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
