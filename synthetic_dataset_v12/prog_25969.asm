; DESCRIPTION: Draws a orange rectangle at (243, 126) with width 97 and height 92.
; PLAN: r0=243(x), r1=126(y), r2=97(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 126
LDI r2, 97
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
