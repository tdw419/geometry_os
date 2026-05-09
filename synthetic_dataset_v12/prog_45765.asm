; DESCRIPTION: Draws a orange rectangle at (228, 38) with width 20 and height 70.
; PLAN: r0=228(x), r1=38(y), r2=20(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 38
LDI r2, 20
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
