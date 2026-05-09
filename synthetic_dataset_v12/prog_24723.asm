; DESCRIPTION: Composite: Sets a single white pixel at (468, 221) then Places a orange 27x21 rectangle at position (295, 228) then Draws a yellow circle centered at (37, 138) with radius 24.
; PLAN: r0=468(x), r1=221(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=228(y), r7=27(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=37(x), r11=138(y), r12=24(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 468
LDI r1, 221
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 228
LDI r7, 27
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 138
LDI r12, 24
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
