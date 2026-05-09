; DESCRIPTION: Composite: Sets a single green pixel at (327, 72) then Creates a magenta circular shape at (145, 44) with radius 15 then Places a red 101x100 rectangle at position (313, 152).
; PLAN: r0=327(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=44(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=152(y), r12=101(width), r13=100(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 145
LDI r6, 44
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 152
LDI r12, 101
LDI r13, 100
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
