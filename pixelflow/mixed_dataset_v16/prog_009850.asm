; DESCRIPTION: Composite: Renders a blue disk with center (273, 201) and radius 55 then Sets a single magenta pixel at (488, 71) then Draws a green rectangle at (288, 209) with width 96 and height 30.
; PLAN: r0=273(x), r1=201(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x), r6=71(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=288(x), r11=209(y), r12=96(width), r13=30(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 201
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 71
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 288
LDI r11, 209
LDI r12, 96
LDI r13, 30
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
