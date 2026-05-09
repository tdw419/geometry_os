; DESCRIPTION: Draws a red rectangle at (386, 108) with width 28 and height 94.
; PLAN: r0=386(x), r1=108(y), r2=28(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 108
LDI r2, 28
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
