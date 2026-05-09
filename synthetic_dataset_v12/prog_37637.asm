; DESCRIPTION: Composite: Places a red dot at position (376, 228) then Creates a orange rectangular region at (111, 16) spanning 79 by 15 pixels then Creates a yellow circular shape at (99, 58) with radius 27.
; PLAN: r0=376(x), r1=228(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=16(y), r7=79(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=58(y), r12=27(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 228
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 111
LDI r6, 16
LDI r7, 79
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 58
LDI r12, 27
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
