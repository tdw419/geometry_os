; DESCRIPTION: Composite: Sets a single magenta pixel at (225, 136) then Creates a yellow circular shape at (479, 72) with radius 25 then Creates a purple rectangular region at (354, 129) spanning 115 by 77 pixels.
; PLAN: r0=225(x), r1=136(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=479(x), r6=72(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x), r11=129(y), r12=115(width), r13=77(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 136
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 479
LDI r6, 72
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 129
LDI r12, 115
LDI r13, 77
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
