; DESCRIPTION: Composite: Sets a single white pixel at (437, 186) then Renders a cyan box of size 57x113 starting at (135, 24) then Creates a orange circular shape at (467, 83) with radius 21.
; PLAN: r0=437(x), r1=186(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=135(x), r6=24(y), r7=57(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=467(x), r11=83(y), r12=21(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 437
LDI r1, 186
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 135
LDI r6, 24
LDI r7, 57
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 83
LDI r12, 21
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
