; DESCRIPTION: Composite: Creates a yellow rectangular region at (403, 126) spanning 41 by 12 pixels then Sets a single magenta pixel at (34, 105) then Renders a red disk with center (271, 204) and radius 45.
; PLAN: r0=403(x), r1=126(y), r2=41(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x), r6=105(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=271(x), r11=204(y), r12=45(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 126
LDI r2, 41
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 105
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 271
LDI r11, 204
LDI r12, 45
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
