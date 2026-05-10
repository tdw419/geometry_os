; DESCRIPTION: Composite: Creates a cyan rectangular region at (383, 17) spanning 115 by 113 pixels then Places a red line segment connecting (115, 6) to (276, 36) then Places a magenta dot at position (455, 243).
; PLAN: r0=383(x), r1=17(y), r2=115(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x1), r6=6(y1), r7=276(x2), r8=36(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=455(x), r11=243(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 17
LDI r2, 115
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 6
LDI r7, 276
LDI r8, 36
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 243
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
