; DESCRIPTION: Composite: Renders a orange box of size 74x79 starting at (121, 59) then Draws a purple circle centered at (133, 58) with radius 38 then Renders a green line between points (298, 57) and (310, 146).
; PLAN: r0=121(x), r1=59(y), r2=74(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=58(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=298(x1), r11=57(y1), r12=310(x2), r13=146(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 59
LDI r2, 74
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 58
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 298
LDI r11, 57
LDI r12, 310
LDI r13, 146
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
