; DESCRIPTION: Composite: Draws a black circle centered at (280, 111) with radius 12 then Creates a purple rectangular region at (277, 37) spanning 72 by 51 pixels.
; PLAN: r0=280(x), r1=111(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x), r6=37(y), r7=72(width), r8=51(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 111
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 37
LDI r7, 72
LDI r8, 51
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
