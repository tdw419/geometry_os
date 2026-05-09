; DESCRIPTION: Composite: Renders a green line between points (167, 100) and (200, 161) then Creates a red rectangular region at (153, 122) spanning 26 by 98 pixels then Renders a cyan disk with center (209, 82) and radius 79.
; PLAN: r0=167(x1), r1=100(y1), r2=200(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=122(y), r7=26(width), r8=98(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x), r11=82(y), r12=79(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 167
LDI r1, 100
LDI r2, 200
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 122
LDI r7, 26
LDI r8, 98
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 82
LDI r12, 79
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
