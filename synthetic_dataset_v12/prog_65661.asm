; DESCRIPTION: Composite: Renders a orange disk with center (160, 120) and radius 56 then Places a white dot at position (427, 146) then Creates a magenta rectangular region at (163, 61) spanning 116 by 59 pixels.
; PLAN: r0=160(x), r1=120(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x), r6=146(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=163(x), r11=61(y), r12=116(width), r13=59(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 120
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 146
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 163
LDI r11, 61
LDI r12, 116
LDI r13, 59
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
