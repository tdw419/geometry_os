; DESCRIPTION: Composite: Renders a yellow disk with center (347, 204) and radius 43 then Draws a red line from (196, 130) to (41, 82) then Renders a red box of size 59x99 starting at (362, 139).
; PLAN: r0=347(x), r1=204(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x1), r6=130(y1), r7=41(x2), r8=82(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=139(y), r12=59(width), r13=99(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 204
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 130
LDI r7, 41
LDI r8, 82
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 139
LDI r12, 59
LDI r13, 99
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
