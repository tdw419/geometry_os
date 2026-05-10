; DESCRIPTION: Composite: Renders a purple disk with center (261, 33) and radius 30 then Places a orange 52x77 rectangle at position (9, 176) then Places a white dot at position (431, 17).
; PLAN: r0=261(x), r1=33(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=176(y), r7=52(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x), r11=17(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 261
LDI r1, 33
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 176
LDI r7, 52
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 17
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
