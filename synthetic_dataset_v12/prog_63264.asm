; DESCRIPTION: Composite: Renders a yellow disk with center (160, 172) and radius 45 then Places a cyan 111x116 rectangle at position (312, 27) then Sets a single black pixel at (173, 138).
; PLAN: r0=160(x), r1=172(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=27(y), r7=111(width), r8=116(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x), r11=138(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 160
LDI r1, 172
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 27
LDI r7, 111
LDI r8, 116
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 138
LDI r12, 0x000000
PSET r10, r11, r12
HALT
