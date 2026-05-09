; DESCRIPTION: Composite: Creates a white circular shape at (197, 86) with radius 50 then Places a purple 105x87 rectangle at position (371, 27) then Renders a white line between points (353, 188) and (1, 153).
; PLAN: r0=197(x), r1=86(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=27(y), r7=105(width), r8=87(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x1), r11=188(y1), r12=1(x2), r13=153(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 86
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 27
LDI r7, 105
LDI r8, 87
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 188
LDI r12, 1
LDI r13, 153
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
