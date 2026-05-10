; DESCRIPTION: Composite: Creates a cyan circular shape at (208, 140) with radius 40 then Sets a single green pixel at (488, 218) then Places a yellow 85x30 rectangle at position (122, 38).
; PLAN: r0=208(x), r1=140(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x), r6=218(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=122(x), r11=38(y), r12=85(width), r13=30(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 140
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 218
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 122
LDI r11, 38
LDI r12, 85
LDI r13, 30
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
