; DESCRIPTION: Composite: Sets a single magenta pixel at (473, 24) then Creates a cyan rectangular region at (364, 117) spanning 61 by 42 pixels then Creates a yellow circular shape at (180, 42) with radius 11.
; PLAN: r0=473(x), r1=24(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=117(y), r7=61(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x), r11=42(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 473
LDI r1, 24
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 117
LDI r7, 61
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 42
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
