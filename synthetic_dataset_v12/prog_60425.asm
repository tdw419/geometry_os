; DESCRIPTION: Composite: Places a orange circle of radius 68 at center (434, 138) then Sets a single purple pixel at (478, 250) then Renders a orange box of size 47x55 starting at (41, 174).
; PLAN: r0=434(x), r1=138(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x), r6=250(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=41(x), r11=174(y), r12=47(width), r13=55(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 138
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 250
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 41
LDI r11, 174
LDI r12, 47
LDI r13, 55
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
