; DESCRIPTION: Composite: Renders a red disk with center (164, 209) and radius 17 then Renders a yellow line between points (75, 247) and (120, 96) then Renders a purple box of size 81x21 starting at (428, 3).
; PLAN: r0=164(x), r1=209(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x1), r6=247(y1), r7=120(x2), r8=96(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=3(y), r12=81(width), r13=21(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 209
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 247
LDI r7, 120
LDI r8, 96
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 3
LDI r12, 81
LDI r13, 21
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
