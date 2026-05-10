; DESCRIPTION: Composite: Sets a single yellow pixel at (30, 54) then Places a red circle of radius 34 at center (366, 124) then Places a blue 31x44 rectangle at position (244, 102).
; PLAN: r0=30(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=124(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=244(x), r11=102(y), r12=31(width), r13=44(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 54
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 366
LDI r6, 124
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 244
LDI r11, 102
LDI r12, 31
LDI r13, 44
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
