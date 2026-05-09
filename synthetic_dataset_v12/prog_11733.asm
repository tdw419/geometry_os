; DESCRIPTION: Composite: Creates a yellow rectangular region at (202, 166) spanning 79 by 74 pixels then Renders a cyan disk with center (207, 38) and radius 17 then Draws a cyan line from (53, 213) to (188, 181).
; PLAN: r0=202(x), r1=166(y), r2=79(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=38(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x1), r11=213(y1), r12=188(x2), r13=181(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 166
LDI r2, 79
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 38
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 213
LDI r12, 188
LDI r13, 181
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
