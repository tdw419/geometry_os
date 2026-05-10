; DESCRIPTION: Composite: Draws a yellow circle centered at (278, 121) with radius 34 then Renders a purple box of size 25x80 starting at (174, 18).
; PLAN: r0=278(x), r1=121(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=18(y), r7=25(width), r8=80(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 121
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 18
LDI r7, 25
LDI r8, 80
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
