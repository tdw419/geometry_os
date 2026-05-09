; DESCRIPTION: Composite: Creates a white rectangular region at (410, 95) spanning 39 by 12 pixels then Renders a yellow line between points (121, 151) and (330, 246) then Sets a single orange pixel at (79, 54).
; PLAN: r0=410(x), r1=95(y), r2=39(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x1), r6=151(y1), r7=330(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=54(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 95
LDI r2, 39
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 151
LDI r7, 330
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 54
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
