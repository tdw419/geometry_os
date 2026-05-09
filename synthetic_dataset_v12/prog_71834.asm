; DESCRIPTION: Draws a red rectangle at (386, 13) with width 11 and height 78.
; PLAN: r0=386(x), r1=13(y), r2=11(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 13
LDI r2, 11
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
