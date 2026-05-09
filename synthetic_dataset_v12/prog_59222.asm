; DESCRIPTION: Composite: Places a magenta line segment connecting (337, 178) to (342, 135) then Renders a orange box of size 18x26 starting at (189, 189).
; PLAN: r0=337(x1), r1=178(y1), r2=342(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=189(y), r7=18(width), r8=26(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 178
LDI r2, 342
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 189
LDI r7, 18
LDI r8, 26
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
