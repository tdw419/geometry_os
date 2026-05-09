; DESCRIPTION: Composite: Creates a black rectangular region at (292, 162) spanning 36 by 27 pixels then Renders a yellow disk with center (388, 53) and radius 50.
; PLAN: r0=292(x), r1=162(y), r2=36(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=53(y), r7=50(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 292
LDI r1, 162
LDI r2, 36
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 53
LDI r7, 50
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
