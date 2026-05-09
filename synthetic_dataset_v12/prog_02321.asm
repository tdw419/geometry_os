; DESCRIPTION: Composite: Draws a orange line from (95, 17) to (233, 168) then Renders a black box of size 30x37 starting at (337, 170).
; PLAN: r0=95(x1), r1=17(y1), r2=233(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=170(y), r7=30(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 17
LDI r2, 233
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 170
LDI r7, 30
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
