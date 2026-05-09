; DESCRIPTION: Composite: Creates a cyan rectangular region at (407, 207) spanning 55 by 41 pixels then Renders a purple disk with center (374, 79) and radius 35 then Places a black dot at position (1, 182).
; PLAN: r0=407(x), r1=207(y), r2=55(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=79(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x), r11=182(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 407
LDI r1, 207
LDI r2, 55
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 79
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 182
LDI r12, 0x000000
PSET r10, r11, r12
HALT
