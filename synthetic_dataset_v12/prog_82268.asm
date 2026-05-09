; DESCRIPTION: Composite: Creates a black rectangular region at (219, 77) spanning 39 by 18 pixels then Draws a red line from (344, 36) to (262, 183) then Sets a single purple pixel at (168, 5).
; PLAN: r0=219(x), r1=77(y), r2=39(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=36(y1), r7=262(x2), r8=183(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=168(x), r11=5(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 77
LDI r2, 39
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 36
LDI r7, 262
LDI r8, 183
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 5
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
