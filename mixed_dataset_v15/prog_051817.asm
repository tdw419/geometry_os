; DESCRIPTION: Composite: Renders a red disk with center (245, 166) and radius 22 then Renders a yellow box of size 55x19 starting at (310, 161) then Places a orange line segment connecting (212, 36) to (180, 150).
; PLAN: r0=245(x), r1=166(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=161(y), r7=55(width), r8=19(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=212(x1), r11=36(y1), r12=180(x2), r13=150(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 166
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 161
LDI r7, 55
LDI r8, 19
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 36
LDI r12, 180
LDI r13, 150
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
