; DESCRIPTION: Composite: Renders a white box of size 58x83 starting at (227, 96) then Draws a orange line from (265, 168) to (123, 68) then Sets a single cyan pixel at (150, 36).
; PLAN: r0=227(x), r1=96(y), r2=58(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x1), r6=168(y1), r7=123(x2), r8=68(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=36(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 96
LDI r2, 58
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 168
LDI r7, 123
LDI r8, 68
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 36
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
