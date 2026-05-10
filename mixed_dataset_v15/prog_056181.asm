; DESCRIPTION: Composite: Places a yellow 39x77 rectangle at position (11, 66) then Sets a single green pixel at (313, 69) then Renders a orange line between points (191, 242) and (400, 178).
; PLAN: r0=11(x), r1=66(y), r2=39(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=69(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=191(x1), r11=242(y1), r12=400(x2), r13=178(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 66
LDI r2, 39
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 69
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 191
LDI r11, 242
LDI r12, 400
LDI r13, 178
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
