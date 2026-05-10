; DESCRIPTION: Composite: Creates a orange circular shape at (213, 115) with radius 18 then Places a red dot at position (214, 239) then Renders a red line between points (461, 203) and (451, 133).
; PLAN: r0=213(x), r1=115(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=239(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=461(x1), r11=203(y1), r12=451(x2), r13=133(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 115
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 239
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 461
LDI r11, 203
LDI r12, 451
LDI r13, 133
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
