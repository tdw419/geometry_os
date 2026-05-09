; DESCRIPTION: Composite: Draws a cyan rectangle at (222, 100) with width 91 and height 109 then Places a cyan line segment connecting (224, 60) to (423, 244).
; PLAN: r0=222(x), r1=100(y), r2=91(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x1), r6=60(y1), r7=423(x2), r8=244(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 100
LDI r2, 91
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 60
LDI r7, 423
LDI r8, 244
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
