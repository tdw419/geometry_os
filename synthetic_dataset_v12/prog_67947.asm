; DESCRIPTION: Composite: Renders a black line between points (15, 205) and (284, 98) then Renders a purple box of size 102x90 starting at (289, 123) then Renders a yellow disk with center (374, 177) and radius 74.
; PLAN: r0=15(x1), r1=205(y1), r2=284(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=123(y), r7=102(width), r8=90(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x), r11=177(y), r12=74(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 205
LDI r2, 284
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 123
LDI r7, 102
LDI r8, 90
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 177
LDI r12, 74
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
