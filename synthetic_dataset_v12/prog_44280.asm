; DESCRIPTION: Composite: Renders a orange box of size 32x114 starting at (290, 122) then Places a red line segment connecting (221, 246) to (292, 210).
; PLAN: r0=290(x), r1=122(y), r2=32(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x1), r6=246(y1), r7=292(x2), r8=210(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 122
LDI r2, 32
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 246
LDI r7, 292
LDI r8, 210
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
