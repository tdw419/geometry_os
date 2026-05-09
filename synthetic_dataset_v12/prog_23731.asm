; DESCRIPTION: Composite: Draws a yellow rectangle at (116, 69) with width 64 and height 87 then Renders a green line between points (280, 1) and (149, 14).
; PLAN: r0=116(x), r1=69(y), r2=64(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x1), r6=1(y1), r7=149(x2), r8=14(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 69
LDI r2, 64
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 1
LDI r7, 149
LDI r8, 14
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
