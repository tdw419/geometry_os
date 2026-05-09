; DESCRIPTION: Composite: Renders a blue disk with center (86, 227) and radius 19 then Draws a white line from (160, 194) to (190, 83) then Renders a black box of size 42x77 starting at (41, 39).
; PLAN: r0=86(x), r1=227(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x1), r6=194(y1), r7=190(x2), r8=83(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=41(x), r11=39(y), r12=42(width), r13=77(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 227
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 194
LDI r7, 190
LDI r8, 83
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 39
LDI r12, 42
LDI r13, 77
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
