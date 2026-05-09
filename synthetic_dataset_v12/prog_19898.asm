; DESCRIPTION: Composite: Sets a single black pixel at (99, 74) then Creates a cyan rectangular region at (202, 164) spanning 34 by 50 pixels then Creates a orange circular shape at (147, 120) with radius 26.
; PLAN: r0=99(x), r1=74(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=164(y), r7=34(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=120(y), r12=26(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 99
LDI r1, 74
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 202
LDI r6, 164
LDI r7, 34
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 120
LDI r12, 26
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
