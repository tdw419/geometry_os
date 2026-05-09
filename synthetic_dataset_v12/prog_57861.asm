; DESCRIPTION: Composite: Draws a green circle centered at (142, 234) with radius 20 then Sets a single cyan pixel at (445, 222) then Creates a magenta rectangular region at (346, 189) spanning 16 by 67 pixels.
; PLAN: r0=142(x), r1=234(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=222(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=346(x), r11=189(y), r12=16(width), r13=67(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 234
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 222
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 346
LDI r11, 189
LDI r12, 16
LDI r13, 67
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
