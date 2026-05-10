; DESCRIPTION: Composite: Renders a orange line between points (69, 175) and (158, 209) then Renders a magenta box of size 72x88 starting at (387, 142).
; PLAN: r0=69(x1), r1=175(y1), r2=158(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=142(y), r7=72(width), r8=88(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 175
LDI r2, 158
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 142
LDI r7, 72
LDI r8, 88
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
