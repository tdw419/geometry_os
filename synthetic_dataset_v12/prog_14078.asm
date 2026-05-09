; DESCRIPTION: Composite: Draws a red line from (269, 134) to (386, 237) then Renders a green box of size 120x108 starting at (150, 123) then Places a white circle of radius 41 at center (156, 204).
; PLAN: r0=269(x1), r1=134(y1), r2=386(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=123(y), r7=120(width), r8=108(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=204(y), r12=41(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 134
LDI r2, 386
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 123
LDI r7, 120
LDI r8, 108
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 204
LDI r12, 41
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
