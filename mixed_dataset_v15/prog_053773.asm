; DESCRIPTION: Composite: Creates a green circular shape at (204, 180) with radius 74 then Sets a single yellow pixel at (271, 252) then Places a orange 27x70 rectangle at position (86, 70).
; PLAN: r0=204(x), r1=180(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=252(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=70(y), r12=27(width), r13=70(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 180
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 252
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 86
LDI r11, 70
LDI r12, 27
LDI r13, 70
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
