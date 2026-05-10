; DESCRIPTION: Composite: Creates a red rectangular region at (214, 12) spanning 96 by 26 pixels then Renders a red line between points (510, 222) and (349, 242) then Sets a single magenta pixel at (195, 15).
; PLAN: r0=214(x), r1=12(y), r2=96(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=510(x1), r6=222(y1), r7=349(x2), r8=242(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=195(x), r11=15(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 12
LDI r2, 96
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 222
LDI r7, 349
LDI r8, 242
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 15
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
