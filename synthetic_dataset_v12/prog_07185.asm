; DESCRIPTION: Composite: Places a white dot at position (360, 245) then Renders a orange line between points (158, 221) and (58, 161) then Places a black circle of radius 60 at center (301, 186).
; PLAN: r0=360(x), r1=245(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=158(x1), r6=221(y1), r7=58(x2), r8=161(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=186(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 245
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 158
LDI r6, 221
LDI r7, 58
LDI r8, 161
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 186
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
