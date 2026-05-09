; DESCRIPTION: Composite: Places a red circle of radius 59 at center (226, 86) then Sets a single green pixel at (274, 116) then Creates a green rectangular region at (202, 146) spanning 70 by 39 pixels.
; PLAN: r0=226(x), r1=86(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=116(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=202(x), r11=146(y), r12=70(width), r13=39(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 86
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 116
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 202
LDI r11, 146
LDI r12, 70
LDI r13, 39
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
