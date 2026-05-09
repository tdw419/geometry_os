; DESCRIPTION: Composite: Renders a orange box of size 53x110 starting at (243, 88) then Places a blue dot at position (39, 245) then Renders a blue line between points (355, 105) and (198, 225).
; PLAN: r0=243(x), r1=88(y), r2=53(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x), r6=245(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=355(x1), r11=105(y1), r12=198(x2), r13=225(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 88
LDI r2, 53
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 245
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 355
LDI r11, 105
LDI r12, 198
LDI r13, 225
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
