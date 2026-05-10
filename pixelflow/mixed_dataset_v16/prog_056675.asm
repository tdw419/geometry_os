; DESCRIPTION: Composite: Draws a yellow rectangle at (71, 51) with width 71 and height 28 then Sets a single magenta pixel at (466, 247) then Places a white line segment connecting (149, 239) to (212, 120).
; PLAN: r0=71(x), r1=51(y), r2=71(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=149(x1), r11=239(y1), r12=212(x2), r13=120(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 51
LDI r2, 71
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 149
LDI r11, 239
LDI r12, 212
LDI r13, 120
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
