; DESCRIPTION: Composite: Draws a red line from (510, 204) to (266, 37) then Creates a blue circular shape at (177, 119) with radius 65 then Creates a cyan rectangular region at (39, 106) spanning 20 by 84 pixels.
; PLAN: r0=510(x1), r1=204(y1), r2=266(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=119(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x), r11=106(y), r12=20(width), r13=84(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 510
LDI r1, 204
LDI r2, 266
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 119
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 106
LDI r12, 20
LDI r13, 84
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
