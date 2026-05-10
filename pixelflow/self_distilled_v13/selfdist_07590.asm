; DESCRIPTION: Draws a orange rectangle at (38, 141) with width 65 and height 50.
; PLAN: r0=38(x), r1=141(y), r2=65(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 141
LDI r2, 65
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
