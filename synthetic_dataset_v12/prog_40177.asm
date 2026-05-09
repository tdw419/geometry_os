; DESCRIPTION: Composite: Places a red dot at position (166, 57) then Creates a orange circular shape at (214, 171) with radius 66 then Creates a blue rectangular region at (22, 168) spanning 26 by 59 pixels.
; PLAN: r0=166(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=171(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=168(y), r12=26(width), r13=59(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 214
LDI r6, 171
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 168
LDI r12, 26
LDI r13, 59
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
