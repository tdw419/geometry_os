; DESCRIPTION: Composite: Renders a white box of size 24x64 starting at (466, 57) then Draws a green line from (231, 233) to (116, 168) then Draws a magenta circle centered at (444, 160) with radius 55.
; PLAN: r0=466(x), r1=57(y), r2=24(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x1), r6=233(y1), r7=116(x2), r8=168(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=444(x), r11=160(y), r12=55(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 57
LDI r2, 24
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 233
LDI r7, 116
LDI r8, 168
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 160
LDI r12, 55
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
