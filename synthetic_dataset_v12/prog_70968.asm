; DESCRIPTION: Composite: Places a cyan circle of radius 57 at center (422, 143) then Renders a black box of size 19x91 starting at (489, 114) then Draws a green line from (76, 69) to (92, 4).
; PLAN: r0=422(x), r1=143(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x), r6=114(y), r7=19(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x1), r11=69(y1), r12=92(x2), r13=4(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 143
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 114
LDI r7, 19
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 69
LDI r12, 92
LDI r13, 4
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
