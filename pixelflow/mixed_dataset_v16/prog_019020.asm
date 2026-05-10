; DESCRIPTION: Composite: Sets a single yellow pixel at (380, 6) then Renders a black box of size 117x39 starting at (300, 205) then Draws a purple line from (287, 105) to (372, 244).
; PLAN: r0=380(x), r1=6(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=205(y), r7=117(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=287(x1), r11=105(y1), r12=372(x2), r13=244(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 6
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 300
LDI r6, 205
LDI r7, 117
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 105
LDI r12, 372
LDI r13, 244
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
