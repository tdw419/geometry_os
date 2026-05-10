; DESCRIPTION: Draws a black rectangle at (180, 126) with width 55 and height 85.
; PLAN: r0=180(x), r1=126(y), r2=55(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 126
LDI r2, 55
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
