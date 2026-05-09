; DESCRIPTION: Composite: Draws a red line from (416, 160) to (60, 37) then Draws a red rectangle at (333, 15) with width 91 and height 119.
; PLAN: r0=416(x1), r1=160(y1), r2=60(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=15(y), r7=91(width), r8=119(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 160
LDI r2, 60
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 15
LDI r7, 91
LDI r8, 119
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
