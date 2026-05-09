; DESCRIPTION: Composite: Creates a red rectangular region at (297, 60) spanning 42 by 115 pixels then Renders a magenta line between points (212, 5) and (7, 42) then Draws a cyan circle centered at (333, 127) with radius 70.
; PLAN: r0=297(x), r1=60(y), r2=42(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x1), r6=5(y1), r7=7(x2), r8=42(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=127(y), r12=70(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 60
LDI r2, 42
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 5
LDI r7, 7
LDI r8, 42
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 127
LDI r12, 70
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
