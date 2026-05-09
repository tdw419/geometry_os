; DESCRIPTION: Composite: Places a red 14x74 rectangle at position (342, 12) then Places a green dot at position (443, 167) then Renders a orange disk with center (96, 149) and radius 73.
; PLAN: r0=342(x), r1=12(y), r2=14(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=167(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=149(y), r12=73(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 342
LDI r1, 12
LDI r2, 14
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 167
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 96
LDI r11, 149
LDI r12, 73
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
