; DESCRIPTION: Composite: Places a magenta dot at position (276, 69) then Renders a purple disk with center (48, 46) and radius 41 then Places a red 79x41 rectangle at position (161, 112).
; PLAN: r0=276(x), r1=69(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=46(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=112(y), r12=79(width), r13=41(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 69
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 48
LDI r6, 46
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 112
LDI r12, 79
LDI r13, 41
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
