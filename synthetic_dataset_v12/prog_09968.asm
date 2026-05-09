; DESCRIPTION: Composite: Sets a single black pixel at (75, 65) then Renders a black disk with center (254, 162) and radius 77 then Renders a black box of size 33x42 starting at (11, 92).
; PLAN: r0=75(x), r1=65(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=162(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=92(y), r12=33(width), r13=42(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 65
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 254
LDI r6, 162
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 92
LDI r12, 33
LDI r13, 42
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
