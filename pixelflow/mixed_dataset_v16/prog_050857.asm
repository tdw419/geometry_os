; DESCRIPTION: Composite: Draws a black circle centered at (366, 193) with radius 47 then Creates a cyan rectangular region at (405, 36) spanning 44 by 11 pixels then Places a blue dot at position (368, 120).
; PLAN: r0=366(x), r1=193(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=36(y), r7=44(width), r8=11(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=368(x), r11=120(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 193
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 36
LDI r7, 44
LDI r8, 11
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 120
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
