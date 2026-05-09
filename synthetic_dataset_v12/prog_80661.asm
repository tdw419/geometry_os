; DESCRIPTION: Composite: Renders a orange disk with center (368, 154) and radius 61 then Places a cyan dot at position (248, 179) then Places a blue line segment connecting (473, 128) to (473, 239).
; PLAN: r0=368(x), r1=154(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=179(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=473(x1), r11=128(y1), r12=473(x2), r13=239(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 154
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 179
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 473
LDI r11, 128
LDI r12, 473
LDI r13, 239
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
