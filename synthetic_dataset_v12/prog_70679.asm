; DESCRIPTION: Composite: Places a red circle of radius 12 at center (203, 108) then Renders a red box of size 115x30 starting at (15, 138).
; PLAN: r0=203(x), r1=108(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=138(y), r7=115(width), r8=30(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 108
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 138
LDI r7, 115
LDI r8, 30
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
