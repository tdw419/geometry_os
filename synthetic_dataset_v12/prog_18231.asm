; DESCRIPTION: Composite: Places a yellow circle of radius 57 at center (345, 59) then Creates a blue rectangular region at (190, 97) spanning 41 by 57 pixels then Places a cyan dot at position (156, 224).
; PLAN: r0=345(x), r1=59(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=97(y), r7=41(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=224(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 59
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 97
LDI r7, 41
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 224
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
