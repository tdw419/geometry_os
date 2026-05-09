; DESCRIPTION: Composite: Renders a black box of size 62x65 starting at (255, 1) then Draws a red line from (397, 54) to (375, 36).
; PLAN: r0=255(x), r1=1(y), r2=62(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x1), r6=54(y1), r7=375(x2), r8=36(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 1
LDI r2, 62
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 54
LDI r7, 375
LDI r8, 36
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
