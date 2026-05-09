; DESCRIPTION: Composite: Draws a orange rectangle at (282, 61) with width 70 and height 59 then Sets a single white pixel at (91, 47) then Places a magenta line segment connecting (202, 94) to (506, 5).
; PLAN: r0=282(x), r1=61(y), r2=70(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=47(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=202(x1), r11=94(y1), r12=506(x2), r13=5(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 61
LDI r2, 70
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 47
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 202
LDI r11, 94
LDI r12, 506
LDI r13, 5
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
