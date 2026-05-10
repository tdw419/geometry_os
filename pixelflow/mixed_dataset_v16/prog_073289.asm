; DESCRIPTION: Composite: Sets a single purple pixel at (205, 245) then Renders a cyan disk with center (106, 130) and radius 66 then Renders a orange box of size 104x98 starting at (364, 96).
; PLAN: r0=205(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=130(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=364(x), r11=96(y), r12=104(width), r13=98(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 130
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 364
LDI r11, 96
LDI r12, 104
LDI r13, 98
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
