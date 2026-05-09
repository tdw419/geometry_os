; DESCRIPTION: Composite: Renders a orange box of size 118x95 starting at (20, 154) then Places a red dot at position (203, 255).
; PLAN: r0=20(x), r1=154(y), r2=118(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x), r6=255(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 20
LDI r1, 154
LDI r2, 118
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 255
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
