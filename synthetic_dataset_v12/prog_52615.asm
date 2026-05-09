; DESCRIPTION: Composite: Renders a white box of size 103x38 starting at (68, 188) then Places a blue line segment connecting (433, 249) to (460, 18) then Places a green circle of radius 59 at center (189, 194).
; PLAN: r0=68(x), r1=188(y), r2=103(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=249(y1), r7=460(x2), r8=18(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=194(y), r12=59(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 68
LDI r1, 188
LDI r2, 103
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 249
LDI r7, 460
LDI r8, 18
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 194
LDI r12, 59
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
