; DESCRIPTION: Composite: Renders a white line between points (260, 27) and (421, 7) then Renders a orange box of size 43x100 starting at (311, 47).
; PLAN: r0=260(x1), r1=27(y1), r2=421(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=47(y), r7=43(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 27
LDI r2, 421
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 47
LDI r7, 43
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
