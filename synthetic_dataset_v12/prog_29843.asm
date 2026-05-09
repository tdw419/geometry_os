; DESCRIPTION: Composite: Creates a green rectangular region at (222, 60) spanning 35 by 110 pixels then Renders a red line between points (161, 254) and (300, 195).
; PLAN: r0=222(x), r1=60(y), r2=35(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x1), r6=254(y1), r7=300(x2), r8=195(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 60
LDI r2, 35
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 254
LDI r7, 300
LDI r8, 195
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
