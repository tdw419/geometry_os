; DESCRIPTION: Draws a red rectangle at (126, 116) with width 59 and height 85.
; PLAN: r0=126(x), r1=116(y), r2=59(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 116
LDI r2, 59
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
