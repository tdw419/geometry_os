; DESCRIPTION: Composite: Renders a blue disk with center (225, 187) and radius 32 then Places a yellow 74x13 rectangle at position (7, 128) then Places a yellow dot at position (459, 91).
; PLAN: r0=225(x), r1=187(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=128(y), r7=74(width), r8=13(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=459(x), r11=91(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 225
LDI r1, 187
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 128
LDI r7, 74
LDI r8, 13
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 91
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
