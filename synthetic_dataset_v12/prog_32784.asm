; DESCRIPTION: Composite: Places a cyan dot at position (156, 58) then Creates a yellow circular shape at (243, 234) with radius 22 then Draws a red rectangle at (361, 44) with width 83 and height 59.
; PLAN: r0=156(x), r1=58(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=234(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=361(x), r11=44(y), r12=83(width), r13=59(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 58
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 234
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 361
LDI r11, 44
LDI r12, 83
LDI r13, 59
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
