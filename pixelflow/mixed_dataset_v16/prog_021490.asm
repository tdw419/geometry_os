; DESCRIPTION: Composite: Renders a yellow box of size 17x102 starting at (197, 40) then Draws a yellow line from (200, 246) to (240, 11).
; PLAN: r0=197(x), r1=40(y), r2=17(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x1), r6=246(y1), r7=240(x2), r8=11(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 40
LDI r2, 17
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 246
LDI r7, 240
LDI r8, 11
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
