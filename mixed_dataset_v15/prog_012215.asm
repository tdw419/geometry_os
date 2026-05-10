; DESCRIPTION: Composite: Renders a white disk with center (82, 120) and radius 32 then Sets a single purple pixel at (13, 121) then Places a blue line segment connecting (26, 122) to (253, 54).
; PLAN: r0=82(x), r1=120(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x), r6=121(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=26(x1), r11=122(y1), r12=253(x2), r13=54(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 120
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 121
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 26
LDI r11, 122
LDI r12, 253
LDI r13, 54
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
