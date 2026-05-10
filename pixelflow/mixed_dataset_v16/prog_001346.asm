; DESCRIPTION: Composite: Places a blue dot at position (174, 151) then Places a red circle of radius 77 at center (132, 147) then Renders a red box of size 108x46 starting at (285, 121).
; PLAN: r0=174(x), r1=151(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=147(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=285(x), r11=121(y), r12=108(width), r13=46(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 151
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 132
LDI r6, 147
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 285
LDI r11, 121
LDI r12, 108
LDI r13, 46
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
