; DESCRIPTION: Composite: Places a yellow dot at position (36, 190) then Places a yellow circle of radius 71 at center (152, 135) then Creates a magenta rectangular region at (243, 8) spanning 89 by 29 pixels.
; PLAN: r0=36(x), r1=190(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=135(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=243(x), r11=8(y), r12=89(width), r13=29(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 190
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 152
LDI r6, 135
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 243
LDI r11, 8
LDI r12, 89
LDI r13, 29
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
