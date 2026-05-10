; DESCRIPTION: Composite: Renders a black disk with center (291, 168) and radius 19 then Places a orange line segment connecting (25, 88) to (182, 101).
; PLAN: r0=291(x), r1=168(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x1), r6=88(y1), r7=182(x2), r8=101(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 168
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 88
LDI r7, 182
LDI r8, 101
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
