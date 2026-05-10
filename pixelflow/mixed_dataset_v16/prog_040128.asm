; DESCRIPTION: Composite: Renders a orange line between points (373, 31) and (100, 124) then Renders a green box of size 71x36 starting at (248, 209) then Creates a cyan circular shape at (307, 177) with radius 39.
; PLAN: r0=373(x1), r1=31(y1), r2=100(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=209(y), r7=71(width), r8=36(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=307(x), r11=177(y), r12=39(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 31
LDI r2, 100
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 209
LDI r7, 71
LDI r8, 36
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 177
LDI r12, 39
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
