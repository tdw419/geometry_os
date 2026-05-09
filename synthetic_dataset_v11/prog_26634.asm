; DESCRIPTION: Draws a orange rectangle at (180, 33) with width 48 and height 74.
; PLAN: r0=180(x), r1=33(y), r2=48(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 33
LDI r2, 48
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
