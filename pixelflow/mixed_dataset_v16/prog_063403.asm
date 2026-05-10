; DESCRIPTION: Composite: Places a black 46x26 rectangle at position (116, 209) then Places a green circle of radius 52 at center (286, 202) then Renders a blue line between points (180, 55) and (260, 18).
; PLAN: r0=116(x), r1=209(y), r2=46(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=202(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x1), r11=55(y1), r12=260(x2), r13=18(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 209
LDI r2, 46
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 202
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 55
LDI r12, 260
LDI r13, 18
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
