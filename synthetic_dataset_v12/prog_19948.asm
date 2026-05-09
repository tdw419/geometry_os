; DESCRIPTION: Draws a orange rectangle at (446, 109) with width 30 and height 70.
; PLAN: r0=446(x), r1=109(y), r2=30(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 109
LDI r2, 30
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
