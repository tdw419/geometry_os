; DESCRIPTION: Composite: Places a cyan dot at position (305, 23) then Creates a green circular shape at (52, 140) with radius 26 then Creates a magenta rectangular region at (330, 85) spanning 47 by 18 pixels.
; PLAN: r0=305(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=140(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x), r11=85(y), r12=47(width), r13=18(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 140
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 85
LDI r12, 47
LDI r13, 18
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
