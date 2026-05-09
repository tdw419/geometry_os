; DESCRIPTION: Composite: Sets a single yellow pixel at (108, 1) then Renders a orange box of size 66x70 starting at (25, 67).
; PLAN: r0=108(x), r1=1(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=67(y), r7=66(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 1
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 25
LDI r6, 67
LDI r7, 66
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
