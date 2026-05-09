; DESCRIPTION: Composite: Renders a cyan disk with center (295, 138) and radius 57 then Creates a white rectangular region at (206, 153) spanning 117 by 95 pixels then Draws a yellow line from (351, 129) to (243, 149).
; PLAN: r0=295(x), r1=138(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=153(y), r7=117(width), r8=95(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=351(x1), r11=129(y1), r12=243(x2), r13=149(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 138
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 153
LDI r7, 117
LDI r8, 95
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 129
LDI r12, 243
LDI r13, 149
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
