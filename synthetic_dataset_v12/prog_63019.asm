; DESCRIPTION: Composite: Renders a yellow disk with center (43, 60) and radius 10 then Sets a single white pixel at (381, 130) then Draws a red line from (21, 1) to (292, 165).
; PLAN: r0=43(x), r1=60(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x), r6=130(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=21(x1), r11=1(y1), r12=292(x2), r13=165(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 60
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 130
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 21
LDI r11, 1
LDI r12, 292
LDI r13, 165
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
