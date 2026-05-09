; DESCRIPTION: Composite: Renders a cyan disk with center (347, 169) and radius 50 then Draws a purple line from (495, 113) to (169, 67) then Places a red 28x102 rectangle at position (372, 36).
; PLAN: r0=347(x), r1=169(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=495(x1), r6=113(y1), r7=169(x2), r8=67(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=36(y), r12=28(width), r13=102(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 169
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 495
LDI r6, 113
LDI r7, 169
LDI r8, 67
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 36
LDI r12, 28
LDI r13, 102
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
