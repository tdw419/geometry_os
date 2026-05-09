; DESCRIPTION: Composite: Places a white 40x45 rectangle at position (370, 33) then Places a blue circle of radius 50 at center (452, 159) then Sets a single purple pixel at (470, 187).
; PLAN: r0=370(x), r1=33(y), r2=40(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=159(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=470(x), r11=187(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 33
LDI r2, 40
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 159
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 470
LDI r11, 187
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
