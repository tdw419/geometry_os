; DESCRIPTION: Composite: Draws a white line from (429, 43) to (169, 189) then Places a red dot at position (382, 74) then Renders a black box of size 69x10 starting at (188, 214).
; PLAN: r0=429(x1), r1=43(y1), r2=169(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=74(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=188(x), r11=214(y), r12=69(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 43
LDI r2, 169
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 74
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 188
LDI r11, 214
LDI r12, 69
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
