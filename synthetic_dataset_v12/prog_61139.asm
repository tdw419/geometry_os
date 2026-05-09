; DESCRIPTION: Composite: Sets a single green pixel at (120, 105) then Places a purple circle of radius 78 at center (100, 125) then Places a cyan 61x91 rectangle at position (118, 59).
; PLAN: r0=120(x), r1=105(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=125(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x), r11=59(y), r12=61(width), r13=91(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 105
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 100
LDI r6, 125
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 59
LDI r12, 61
LDI r13, 91
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
