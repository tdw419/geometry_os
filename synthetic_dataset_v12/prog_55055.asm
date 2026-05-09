; DESCRIPTION: Composite: Draws a magenta circle centered at (334, 173) with radius 41 then Places a purple 89x46 rectangle at position (313, 176) then Renders a cyan line between points (60, 254) and (79, 0).
; PLAN: r0=334(x), r1=173(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x), r6=176(y), r7=89(width), r8=46(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=60(x1), r11=254(y1), r12=79(x2), r13=0(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 173
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 176
LDI r7, 89
LDI r8, 46
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 254
LDI r12, 79
LDI r13, 0
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
