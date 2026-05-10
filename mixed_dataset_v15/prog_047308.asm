; DESCRIPTION: Composite: Places a white dot at position (438, 127) then Places a orange line segment connecting (42, 34) to (265, 247) then Renders a orange box of size 107x12 starting at (362, 35).
; PLAN: r0=438(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=34(y1), r7=265(x2), r8=247(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=35(y), r12=107(width), r13=12(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 34
LDI r7, 265
LDI r8, 247
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 35
LDI r12, 107
LDI r13, 12
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
