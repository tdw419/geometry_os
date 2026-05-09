; DESCRIPTION: Composite: Places a orange circle of radius 26 at center (225, 113) then Renders a blue box of size 57x45 starting at (360, 63) then Draws a blue line from (63, 124) to (182, 6).
; PLAN: r0=225(x), r1=113(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=63(y), r7=57(width), r8=45(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=63(x1), r11=124(y1), r12=182(x2), r13=6(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 113
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 63
LDI r7, 57
LDI r8, 45
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 124
LDI r12, 182
LDI r13, 6
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
