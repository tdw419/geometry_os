; DESCRIPTION: Composite: Creates a purple circular shape at (373, 184) with radius 64 then Renders a white line between points (504, 137) and (16, 130) then Places a black dot at position (91, 237).
; PLAN: r0=373(x), r1=184(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x1), r6=137(y1), r7=16(x2), r8=130(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=91(x), r11=237(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 184
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 137
LDI r7, 16
LDI r8, 130
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 237
LDI r12, 0x000000
PSET r10, r11, r12
HALT
