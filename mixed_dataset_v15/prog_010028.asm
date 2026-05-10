; DESCRIPTION: Composite: Sets a single black pixel at (313, 162) then Renders a yellow disk with center (341, 153) and radius 80 then Creates a red rectangular region at (153, 127) spanning 77 by 13 pixels.
; PLAN: r0=313(x), r1=162(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=153(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x), r11=127(y), r12=77(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 162
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 341
LDI r6, 153
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 127
LDI r12, 77
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
