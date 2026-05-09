; DESCRIPTION: Composite: Places a cyan circle of radius 22 at center (466, 187) then Renders a green line between points (80, 205) and (248, 199) then Draws a red rectangle at (199, 164) with width 76 and height 57.
; PLAN: r0=466(x), r1=187(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x1), r6=205(y1), r7=248(x2), r8=199(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=164(y), r12=76(width), r13=57(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 187
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 205
LDI r7, 248
LDI r8, 199
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 164
LDI r12, 76
LDI r13, 57
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
