; DESCRIPTION: Composite: Renders a orange box of size 17x53 starting at (471, 171) then Renders a cyan disk with center (97, 210) and radius 21 then Draws a yellow line from (229, 59) to (489, 80).
; PLAN: r0=471(x), r1=171(y), r2=17(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=210(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=229(x1), r11=59(y1), r12=489(x2), r13=80(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 171
LDI r2, 17
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 210
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 229
LDI r11, 59
LDI r12, 489
LDI r13, 80
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
