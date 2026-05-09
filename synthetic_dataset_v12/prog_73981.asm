; DESCRIPTION: Composite: Draws a black line from (327, 56) to (485, 177) then Places a white 95x55 rectangle at position (168, 109) then Places a green circle of radius 27 at center (55, 50).
; PLAN: r0=327(x1), r1=56(y1), r2=485(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=109(y), r7=95(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x), r11=50(y), r12=27(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 56
LDI r2, 485
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 109
LDI r7, 95
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 50
LDI r12, 27
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
