; DESCRIPTION: Composite: Places a green 39x45 rectangle at position (295, 137) then Creates a green circular shape at (109, 197) with radius 15 then Sets a single black pixel at (161, 132).
; PLAN: r0=295(x), r1=137(y), r2=39(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=197(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=132(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 137
LDI r2, 39
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 197
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 132
LDI r12, 0x000000
PSET r10, r11, r12
HALT
