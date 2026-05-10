; DESCRIPTION: Composite: Creates a purple circular shape at (187, 54) with radius 39 then Places a white line segment connecting (86, 130) to (103, 128) then Places a green dot at position (19, 133).
; PLAN: r0=187(x), r1=54(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x1), r6=130(y1), r7=103(x2), r8=128(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=133(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 187
LDI r1, 54
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 130
LDI r7, 103
LDI r8, 128
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 133
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
