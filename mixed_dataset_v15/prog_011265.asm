; DESCRIPTION: Composite: Creates a orange circular shape at (210, 141) with radius 72 then Places a blue 96x11 rectangle at position (284, 39) then Renders a red line between points (352, 154) and (347, 171).
; PLAN: r0=210(x), r1=141(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=39(y), r7=96(width), r8=11(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=352(x1), r11=154(y1), r12=347(x2), r13=171(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 141
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 39
LDI r7, 96
LDI r8, 11
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 154
LDI r12, 347
LDI r13, 171
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
