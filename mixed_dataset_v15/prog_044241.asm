; DESCRIPTION: Composite: Creates a red rectangular region at (396, 6) spanning 98 by 92 pixels then Draws a yellow line from (332, 34) to (403, 213) then Places a magenta dot at position (205, 157).
; PLAN: r0=396(x), r1=6(y), r2=98(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x1), r6=34(y1), r7=403(x2), r8=213(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=157(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 6
LDI r2, 98
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 34
LDI r7, 403
LDI r8, 213
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 157
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
