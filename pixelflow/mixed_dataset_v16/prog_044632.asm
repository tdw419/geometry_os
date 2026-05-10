; DESCRIPTION: Composite: Renders a purple disk with center (316, 52) and radius 23 then Renders a orange box of size 33x21 starting at (51, 111) then Places a yellow dot at position (198, 198).
; PLAN: r0=316(x), r1=52(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=111(y), r7=33(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x), r11=198(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 52
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 111
LDI r7, 33
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 198
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
