; DESCRIPTION: Draws a cyan rectangle at (360, 63) with width 69 and height 10.
; PLAN: r0=360(x), r1=63(y), r2=69(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 63
LDI r2, 69
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
