; DESCRIPTION: Composite: Draws a orange line from (121, 220) to (474, 224) then Places a magenta circle of radius 76 at center (113, 107) then Places a orange 102x61 rectangle at position (374, 13).
; PLAN: r0=121(x1), r1=220(y1), r2=474(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=107(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=13(y), r12=102(width), r13=61(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 220
LDI r2, 474
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 107
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 13
LDI r12, 102
LDI r13, 61
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
