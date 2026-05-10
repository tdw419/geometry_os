; DESCRIPTION: Composite: Renders a orange box of size 106x50 starting at (87, 137) then Renders a white line between points (472, 69) and (196, 135).
; PLAN: r0=87(x), r1=137(y), r2=106(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x1), r6=69(y1), r7=196(x2), r8=135(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 137
LDI r2, 106
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 69
LDI r7, 196
LDI r8, 135
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
