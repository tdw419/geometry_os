; DESCRIPTION: Composite: Renders a black box of size 38x40 starting at (433, 21) then Draws a cyan circle centered at (321, 163) with radius 77 then Places a black line segment connecting (58, 233) to (219, 195).
; PLAN: r0=433(x), r1=21(y), r2=38(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=163(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x1), r11=233(y1), r12=219(x2), r13=195(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 21
LDI r2, 38
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 163
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 233
LDI r12, 219
LDI r13, 195
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
