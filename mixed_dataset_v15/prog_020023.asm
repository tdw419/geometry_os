; DESCRIPTION: Composite: Places a magenta line segment connecting (360, 222) to (472, 116) then Renders a white box of size 36x26 starting at (64, 22).
; PLAN: r0=360(x1), r1=222(y1), r2=472(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=22(y), r7=36(width), r8=26(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 222
LDI r2, 472
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 22
LDI r7, 36
LDI r8, 26
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
