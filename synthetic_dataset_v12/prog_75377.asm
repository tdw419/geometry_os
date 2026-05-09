; DESCRIPTION: Composite: Sets a single green pixel at (401, 14) then Draws a orange circle centered at (198, 105) with radius 63 then Renders a black line between points (163, 49) and (488, 215).
; PLAN: r0=401(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=198(x), r6=105(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x1), r11=49(y1), r12=488(x2), r13=215(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 14
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 198
LDI r6, 105
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 49
LDI r12, 488
LDI r13, 215
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
