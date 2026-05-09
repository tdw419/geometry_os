; DESCRIPTION: Composite: Renders a orange box of size 29x116 starting at (283, 81) then Draws a green line from (244, 108) to (471, 1).
; PLAN: r0=283(x), r1=81(y), r2=29(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x1), r6=108(y1), r7=471(x2), r8=1(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 81
LDI r2, 29
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 108
LDI r7, 471
LDI r8, 1
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
