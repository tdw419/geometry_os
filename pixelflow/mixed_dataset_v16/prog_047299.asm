; DESCRIPTION: Composite: Creates a magenta rectangular region at (175, 42) spanning 36 by 103 pixels then Renders a blue line between points (203, 4) and (335, 221) then Sets a single green pixel at (171, 1).
; PLAN: r0=175(x), r1=42(y), r2=36(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x1), r6=4(y1), r7=335(x2), r8=221(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=1(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 175
LDI r1, 42
LDI r2, 36
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 4
LDI r7, 335
LDI r8, 221
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 1
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
