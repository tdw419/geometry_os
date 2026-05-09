; DESCRIPTION: Composite: Renders a red line between points (299, 222) and (281, 135) then Renders a orange box of size 85x60 starting at (33, 139).
; PLAN: r0=299(x1), r1=222(y1), r2=281(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=139(y), r7=85(width), r8=60(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 222
LDI r2, 281
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 139
LDI r7, 85
LDI r8, 60
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
