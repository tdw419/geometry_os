; DESCRIPTION: Composite: Places a orange dot at position (61, 28) then Draws a white line from (138, 209) to (197, 15) then Draws a red rectangle at (333, 162) with width 91 and height 34.
; PLAN: r0=61(x), r1=28(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=138(x1), r6=209(y1), r7=197(x2), r8=15(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=162(y), r12=91(width), r13=34(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 28
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 138
LDI r6, 209
LDI r7, 197
LDI r8, 15
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 162
LDI r12, 91
LDI r13, 34
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
