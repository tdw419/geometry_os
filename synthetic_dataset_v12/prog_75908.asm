; DESCRIPTION: Composite: Renders a orange box of size 61x51 starting at (246, 49) then Creates a yellow circular shape at (360, 155) with radius 55 then Draws a cyan line from (387, 107) to (383, 5).
; PLAN: r0=246(x), r1=49(y), r2=61(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=155(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=387(x1), r11=107(y1), r12=383(x2), r13=5(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 49
LDI r2, 61
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 155
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 387
LDI r11, 107
LDI r12, 383
LDI r13, 5
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
