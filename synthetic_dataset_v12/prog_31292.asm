; DESCRIPTION: Composite: Draws a yellow circle centered at (204, 151) with radius 34 then Places a white 28x28 rectangle at position (167, 148) then Renders a blue line between points (98, 219) and (439, 29).
; PLAN: r0=204(x), r1=151(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=148(y), r7=28(width), r8=28(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x1), r11=219(y1), r12=439(x2), r13=29(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 151
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 148
LDI r7, 28
LDI r8, 28
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 219
LDI r12, 439
LDI r13, 29
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
