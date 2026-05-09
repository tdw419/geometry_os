; DESCRIPTION: Composite: Draws a red rectangle at (387, 76) with width 15 and height 73 then Places a red dot at position (403, 227) then Renders a blue disk with center (54, 191) and radius 43.
; PLAN: r0=387(x), r1=76(y), r2=15(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=227(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=54(x), r11=191(y), r12=43(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 76
LDI r2, 15
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 227
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 54
LDI r11, 191
LDI r12, 43
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
