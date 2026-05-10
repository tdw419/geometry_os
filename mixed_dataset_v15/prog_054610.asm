; DESCRIPTION: Composite: Places a magenta circle of radius 75 at center (309, 102) then Places a yellow 66x92 rectangle at position (143, 86) then Renders a yellow line between points (280, 52) and (143, 180).
; PLAN: r0=309(x), r1=102(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=86(y), r7=66(width), r8=92(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x1), r11=52(y1), r12=143(x2), r13=180(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 102
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 86
LDI r7, 66
LDI r8, 92
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 52
LDI r12, 143
LDI r13, 180
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
