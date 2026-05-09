; DESCRIPTION: Composite: Renders a magenta disk with center (314, 70) and radius 38 then Places a white dot at position (109, 17) then Renders a cyan line between points (480, 36) and (481, 20).
; PLAN: r0=314(x), r1=70(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=17(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=480(x1), r11=36(y1), r12=481(x2), r13=20(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 70
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 17
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 480
LDI r11, 36
LDI r12, 481
LDI r13, 20
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
