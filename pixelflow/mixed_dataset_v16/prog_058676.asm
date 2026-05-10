; DESCRIPTION: Composite: Draws a black line from (335, 225) to (140, 39) then Renders a orange disk with center (86, 47) and radius 46 then Renders a cyan box of size 120x17 starting at (97, 101).
; PLAN: r0=335(x1), r1=225(y1), r2=140(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=47(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x), r11=101(y), r12=120(width), r13=17(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 225
LDI r2, 140
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 47
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 101
LDI r12, 120
LDI r13, 17
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
