; DESCRIPTION: Renders a orange box of size 20x15 starting at (468, 230).
; PLAN: r0=468(x), r1=230(y), r2=20(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 230
LDI r2, 20
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
