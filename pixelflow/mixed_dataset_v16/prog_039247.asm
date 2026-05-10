; DESCRIPTION: Composite: Draws a red line from (213, 175) to (105, 88) then Renders a blue disk with center (103, 171) and radius 70 then Places a blue 120x55 rectangle at position (227, 118).
; PLAN: r0=213(x1), r1=175(y1), r2=105(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=171(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=227(x), r11=118(y), r12=120(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 175
LDI r2, 105
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 171
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 227
LDI r11, 118
LDI r12, 120
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
