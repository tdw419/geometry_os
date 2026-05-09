; DESCRIPTION: Composite: Places a blue line segment connecting (388, 151) to (219, 213) then Creates a black circular shape at (174, 98) with radius 55 then Renders a cyan box of size 95x31 starting at (417, 39).
; PLAN: r0=388(x1), r1=151(y1), r2=219(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=98(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=417(x), r11=39(y), r12=95(width), r13=31(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 151
LDI r2, 219
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 98
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 417
LDI r11, 39
LDI r12, 95
LDI r13, 31
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
