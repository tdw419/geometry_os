; DESCRIPTION: Composite: Places a black line segment connecting (452, 37) to (75, 168) then Creates a cyan circular shape at (219, 164) with radius 64 then Renders a red box of size 46x56 starting at (366, 3).
; PLAN: r0=452(x1), r1=37(y1), r2=75(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=164(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=366(x), r11=3(y), r12=46(width), r13=56(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 37
LDI r2, 75
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 164
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 366
LDI r11, 3
LDI r12, 46
LDI r13, 56
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
