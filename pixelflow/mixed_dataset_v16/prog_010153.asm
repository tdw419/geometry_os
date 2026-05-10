; DESCRIPTION: Composite: Places a orange dot at position (262, 138) then Draws a cyan line from (283, 210) to (275, 206) then Draws a black rectangle at (179, 70) with width 34 and height 38.
; PLAN: r0=262(x), r1=138(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=210(y1), r7=275(x2), r8=206(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=70(y), r12=34(width), r13=38(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 138
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 283
LDI r6, 210
LDI r7, 275
LDI r8, 206
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 70
LDI r12, 34
LDI r13, 38
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
