; DESCRIPTION: Composite: Sets a single cyan pixel at (330, 199) then Places a cyan line segment connecting (0, 98) to (155, 21) then Renders a orange box of size 59x88 starting at (122, 112).
; PLAN: r0=330(x), r1=199(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=0(x1), r6=98(y1), r7=155(x2), r8=21(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=122(x), r11=112(y), r12=59(width), r13=88(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 199
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 0
LDI r6, 98
LDI r7, 155
LDI r8, 21
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 112
LDI r12, 59
LDI r13, 88
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
