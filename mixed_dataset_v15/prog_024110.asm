; DESCRIPTION: Composite: Places a red line segment connecting (12, 183) to (37, 247) then Renders a red box of size 93x17 starting at (16, 63).
; PLAN: r0=12(x1), r1=183(y1), r2=37(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=16(x), r6=63(y), r7=93(width), r8=17(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 12
LDI r1, 183
LDI r2, 37
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 63
LDI r7, 93
LDI r8, 17
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
