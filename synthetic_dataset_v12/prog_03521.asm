; DESCRIPTION: Composite: Renders a red box of size 24x56 starting at (429, 72) then Creates a green circular shape at (184, 198) with radius 31 then Draws a cyan line from (73, 128) to (447, 239).
; PLAN: r0=429(x), r1=72(y), r2=24(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=198(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x1), r11=128(y1), r12=447(x2), r13=239(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 72
LDI r2, 24
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 198
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 128
LDI r12, 447
LDI r13, 239
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
