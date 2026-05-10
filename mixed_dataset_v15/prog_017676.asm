; DESCRIPTION: Composite: Creates a blue rectangular region at (161, 151) spanning 76 by 27 pixels then Renders a cyan line between points (121, 157) and (215, 152) then Renders a green disk with center (286, 75) and radius 75.
; PLAN: r0=161(x), r1=151(y), r2=76(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x1), r6=157(y1), r7=215(x2), r8=152(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=75(y), r12=75(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 151
LDI r2, 76
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 157
LDI r7, 215
LDI r8, 152
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 75
LDI r12, 75
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
