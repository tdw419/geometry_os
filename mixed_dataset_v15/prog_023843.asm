; DESCRIPTION: Composite: Sets a single red pixel at (66, 154) then Creates a red circular shape at (124, 162) with radius 53 then Renders a black box of size 40x108 starting at (292, 91).
; PLAN: r0=66(x), r1=154(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=162(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=91(y), r12=40(width), r13=108(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 154
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 124
LDI r6, 162
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 91
LDI r12, 40
LDI r13, 108
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
