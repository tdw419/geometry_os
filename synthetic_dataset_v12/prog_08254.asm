; DESCRIPTION: Composite: Places a red line segment connecting (24, 172) to (35, 255) then Places a magenta 114x55 rectangle at position (53, 196).
; PLAN: r0=24(x1), r1=172(y1), r2=35(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=196(y), r7=114(width), r8=55(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 172
LDI r2, 35
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 196
LDI r7, 114
LDI r8, 55
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
