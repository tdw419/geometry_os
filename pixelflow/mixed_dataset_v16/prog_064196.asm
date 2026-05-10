; DESCRIPTION: Composite: Draws a black line from (385, 196) to (195, 222) then Places a orange dot at position (452, 239) then Renders a red box of size 50x71 starting at (389, 134).
; PLAN: r0=385(x1), r1=196(y1), r2=195(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=239(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=389(x), r11=134(y), r12=50(width), r13=71(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 196
LDI r2, 195
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 239
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 389
LDI r11, 134
LDI r12, 50
LDI r13, 71
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
