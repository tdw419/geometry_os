; DESCRIPTION: Composite: Places a white circle of radius 33 at center (401, 107) then Sets a single cyan pixel at (109, 78) then Places a blue 89x86 rectangle at position (395, 170).
; PLAN: r0=401(x), r1=107(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=78(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=395(x), r11=170(y), r12=89(width), r13=86(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 107
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 78
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 395
LDI r11, 170
LDI r12, 89
LDI r13, 86
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
