; DESCRIPTION: Composite: Places a white circle of radius 47 at center (461, 196) then Sets a single cyan pixel at (186, 92) then Creates a green rectangular region at (199, 86) spanning 91 by 79 pixels.
; PLAN: r0=461(x), r1=196(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=92(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=86(y), r12=91(width), r13=79(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 196
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 92
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 199
LDI r11, 86
LDI r12, 91
LDI r13, 79
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
