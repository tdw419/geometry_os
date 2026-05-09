; DESCRIPTION: Composite: Renders a cyan line between points (368, 63) and (301, 190) then Places a magenta 89x105 rectangle at position (56, 114) then Places a cyan circle of radius 75 at center (102, 147).
; PLAN: r0=368(x1), r1=63(y1), r2=301(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=114(y), r7=89(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=147(y), r12=75(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 368
LDI r1, 63
LDI r2, 301
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 114
LDI r7, 89
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 147
LDI r12, 75
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
