; DESCRIPTION: Composite: Renders a red box of size 97x16 starting at (202, 143) then Draws a blue line from (400, 125) to (44, 31) then Places a yellow circle of radius 35 at center (112, 216).
; PLAN: r0=202(x), r1=143(y), r2=97(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=125(y1), r7=44(x2), r8=31(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=112(x), r11=216(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 202
LDI r1, 143
LDI r2, 97
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 125
LDI r7, 44
LDI r8, 31
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 216
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
