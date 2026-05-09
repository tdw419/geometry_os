; DESCRIPTION: Composite: Draws a green line from (329, 72) to (348, 202) then Places a red dot at position (301, 95) then Renders a orange box of size 96x75 starting at (9, 86).
; PLAN: r0=329(x1), r1=72(y1), r2=348(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=95(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=9(x), r11=86(y), r12=96(width), r13=75(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 72
LDI r2, 348
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 95
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 9
LDI r11, 86
LDI r12, 96
LDI r13, 75
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
