; DESCRIPTION: Composite: Places a green circle of radius 25 at center (166, 221) then Creates a green rectangular region at (296, 26) spanning 68 by 38 pixels then Places a blue dot at position (401, 134).
; PLAN: r0=166(x), r1=221(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=26(y), r7=68(width), r8=38(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x), r11=134(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 166
LDI r1, 221
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 26
LDI r7, 68
LDI r8, 38
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 134
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
