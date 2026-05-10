; DESCRIPTION: Composite: Draws a orange circle centered at (352, 136) with radius 64 then Places a orange 27x39 rectangle at position (416, 209) then Draws a purple line from (67, 241) to (337, 217).
; PLAN: r0=352(x), r1=136(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=209(y), r7=27(width), r8=39(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x1), r11=241(y1), r12=337(x2), r13=217(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 136
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 209
LDI r7, 27
LDI r8, 39
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 241
LDI r12, 337
LDI r13, 217
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
