; DESCRIPTION: Composite: Places a green 78x47 rectangle at position (306, 78) then Places a yellow dot at position (333, 28) then Draws a red line from (262, 138) to (17, 25).
; PLAN: r0=306(x), r1=78(y), r2=78(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=28(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=262(x1), r11=138(y1), r12=17(x2), r13=25(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 78
LDI r2, 78
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 28
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 262
LDI r11, 138
LDI r12, 17
LDI r13, 25
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
