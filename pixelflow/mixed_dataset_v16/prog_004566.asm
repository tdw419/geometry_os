; DESCRIPTION: Composite: Renders a cyan disk with center (321, 68) and radius 68 then Renders a magenta box of size 26x117 starting at (106, 112) then Draws a yellow line from (199, 44) to (465, 205).
; PLAN: r0=321(x), r1=68(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=112(y), r7=26(width), r8=117(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x1), r11=44(y1), r12=465(x2), r13=205(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 68
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 112
LDI r7, 26
LDI r8, 117
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 44
LDI r12, 465
LDI r13, 205
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
