; DESCRIPTION: Composite: Creates a green rectangular region at (295, 166) spanning 18 by 20 pixels then Places a green circle of radius 25 at center (413, 148) then Sets a single orange pixel at (176, 197).
; PLAN: r0=295(x), r1=166(y), r2=18(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=148(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=176(x), r11=197(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 166
LDI r2, 18
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 148
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 176
LDI r11, 197
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
