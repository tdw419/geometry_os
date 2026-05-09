; DESCRIPTION: Composite: Draws a cyan line from (40, 201) to (61, 227) then Draws a yellow circle centered at (447, 73) with radius 10 then Renders a orange box of size 25x111 starting at (39, 49).
; PLAN: r0=40(x1), r1=201(y1), r2=61(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=73(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x), r11=49(y), r12=25(width), r13=111(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 40
LDI r1, 201
LDI r2, 61
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 73
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 49
LDI r12, 25
LDI r13, 111
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
