; DESCRIPTION: Composite: Places a white 102x52 rectangle at position (43, 59) then Draws a yellow line from (435, 222) to (429, 206) then Renders a magenta disk with center (180, 177) and radius 60.
; PLAN: r0=43(x), r1=59(y), r2=102(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x1), r6=222(y1), r7=429(x2), r8=206(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=180(x), r11=177(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 59
LDI r2, 102
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 222
LDI r7, 429
LDI r8, 206
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 177
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
