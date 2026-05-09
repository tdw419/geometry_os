; DESCRIPTION: Composite: Creates a purple rectangular region at (280, 10) spanning 42 by 108 pixels then Places a white circle of radius 15 at center (241, 111) then Draws a white line from (1, 94) to (436, 90).
; PLAN: r0=280(x), r1=10(y), r2=42(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=111(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x1), r11=94(y1), r12=436(x2), r13=90(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 10
LDI r2, 42
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 111
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 94
LDI r12, 436
LDI r13, 90
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
