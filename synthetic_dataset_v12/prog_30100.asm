; DESCRIPTION: Composite: Draws a cyan circle centered at (301, 209) with radius 12 then Renders a magenta box of size 23x44 starting at (39, 156) then Places a yellow line segment connecting (383, 67) to (140, 209).
; PLAN: r0=301(x), r1=209(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=156(y), r7=23(width), r8=44(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x1), r11=67(y1), r12=140(x2), r13=209(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 209
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 156
LDI r7, 23
LDI r8, 44
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 67
LDI r12, 140
LDI r13, 209
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
