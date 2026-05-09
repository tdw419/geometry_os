; DESCRIPTION: Composite: Renders a green box of size 26x99 starting at (213, 102) then Draws a yellow line from (361, 215) to (344, 84) then Creates a cyan circular shape at (394, 102) with radius 61.
; PLAN: r0=213(x), r1=102(y), r2=26(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x1), r6=215(y1), r7=344(x2), r8=84(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=102(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 213
LDI r1, 102
LDI r2, 26
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 215
LDI r7, 344
LDI r8, 84
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 102
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
