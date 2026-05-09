; DESCRIPTION: Composite: Renders a black disk with center (66, 198) and radius 31 then Places a magenta 74x99 rectangle at position (132, 5) then Places a cyan line segment connecting (417, 172) to (463, 98).
; PLAN: r0=66(x), r1=198(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=5(y), r7=74(width), r8=99(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x1), r11=172(y1), r12=463(x2), r13=98(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 198
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 5
LDI r7, 74
LDI r8, 99
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 172
LDI r12, 463
LDI r13, 98
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
