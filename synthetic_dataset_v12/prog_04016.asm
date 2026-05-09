; DESCRIPTION: Composite: Draws a green line from (469, 161) to (44, 84) then Renders a white disk with center (193, 82) and radius 27 then Places a orange 92x39 rectangle at position (176, 88).
; PLAN: r0=469(x1), r1=161(y1), r2=44(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=82(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=176(x), r11=88(y), r12=92(width), r13=39(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 161
LDI r2, 44
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 82
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 176
LDI r11, 88
LDI r12, 92
LDI r13, 39
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
