; DESCRIPTION: Composite: Places a cyan line segment connecting (83, 28) to (98, 225) then Draws a orange rectangle at (154, 72) with width 36 and height 70.
; PLAN: r0=83(x1), r1=28(y1), r2=98(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=72(y), r7=36(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 28
LDI r2, 98
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 72
LDI r7, 36
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
