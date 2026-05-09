; DESCRIPTION: Composite: Sets a single yellow pixel at (367, 59) then Renders a orange box of size 81x34 starting at (143, 187) then Places a cyan line segment connecting (376, 136) to (400, 76).
; PLAN: r0=367(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=143(x), r6=187(y), r7=81(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=376(x1), r11=136(y1), r12=400(x2), r13=76(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 143
LDI r6, 187
LDI r7, 81
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 136
LDI r12, 400
LDI r13, 76
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
