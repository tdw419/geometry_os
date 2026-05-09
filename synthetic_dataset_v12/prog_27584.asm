; DESCRIPTION: Composite: Creates a red rectangular region at (298, 152) spanning 15 by 35 pixels then Places a blue dot at position (358, 77) then Renders a magenta disk with center (270, 164) and radius 69.
; PLAN: r0=298(x), r1=152(y), r2=15(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=77(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=270(x), r11=164(y), r12=69(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 152
LDI r2, 15
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 77
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 270
LDI r11, 164
LDI r12, 69
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
