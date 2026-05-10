; DESCRIPTION: Composite: Draws a purple line from (318, 110) to (346, 139) then Renders a black box of size 55x15 starting at (367, 121).
; PLAN: r0=318(x1), r1=110(y1), r2=346(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=121(y), r7=55(width), r8=15(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 110
LDI r2, 346
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 121
LDI r7, 55
LDI r8, 15
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
