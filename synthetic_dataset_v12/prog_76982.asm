; DESCRIPTION: Composite: Draws a green line from (399, 50) to (129, 59) then Renders a cyan box of size 35x96 starting at (424, 53) then Places a green circle of radius 37 at center (137, 180).
; PLAN: r0=399(x1), r1=50(y1), r2=129(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=53(y), r7=35(width), r8=96(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x), r11=180(y), r12=37(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 399
LDI r1, 50
LDI r2, 129
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 53
LDI r7, 35
LDI r8, 96
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 180
LDI r12, 37
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
