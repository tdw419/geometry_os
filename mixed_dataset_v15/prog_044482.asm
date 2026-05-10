; DESCRIPTION: Composite: Places a purple dot at position (359, 20) then Renders a orange box of size 101x108 starting at (84, 1).
; PLAN: r0=359(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=1(y), r7=101(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 20
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 84
LDI r6, 1
LDI r7, 101
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
