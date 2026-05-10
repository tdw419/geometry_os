; DESCRIPTION: Composite: Renders a black disk with center (292, 220) and radius 34 then Places a black line segment connecting (115, 69) to (454, 236) then Places a purple dot at position (128, 29).
; PLAN: r0=292(x), r1=220(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x1), r6=69(y1), r7=454(x2), r8=236(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=128(x), r11=29(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 220
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 69
LDI r7, 454
LDI r8, 236
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 29
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
