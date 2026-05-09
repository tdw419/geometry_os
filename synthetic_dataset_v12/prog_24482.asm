; DESCRIPTION: Composite: Draws a magenta rectangle at (60, 91) with width 106 and height 106 then Renders a cyan line between points (116, 80) and (464, 206) then Sets a single orange pixel at (456, 134).
; PLAN: r0=60(x), r1=91(y), r2=106(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x1), r6=80(y1), r7=464(x2), r8=206(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=134(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 91
LDI r2, 106
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 80
LDI r7, 464
LDI r8, 206
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 134
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
