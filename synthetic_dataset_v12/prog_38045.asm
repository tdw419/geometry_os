; DESCRIPTION: Composite: Places a orange 36x100 rectangle at position (361, 125) then Renders a blue disk with center (377, 176) and radius 80 then Renders a red line between points (69, 0) and (247, 114).
; PLAN: r0=361(x), r1=125(y), r2=36(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=176(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x1), r11=0(y1), r12=247(x2), r13=114(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 125
LDI r2, 36
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 176
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 0
LDI r12, 247
LDI r13, 114
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
