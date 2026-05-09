; DESCRIPTION: Composite: Draws a magenta line from (176, 27) to (81, 167) then Creates a orange rectangular region at (98, 138) spanning 88 by 95 pixels then Places a cyan dot at position (405, 227).
; PLAN: r0=176(x1), r1=27(y1), r2=81(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=138(y), r7=88(width), r8=95(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x), r11=227(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 27
LDI r2, 81
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 138
LDI r7, 88
LDI r8, 95
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 227
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
