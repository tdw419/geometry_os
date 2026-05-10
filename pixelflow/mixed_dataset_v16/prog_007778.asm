; DESCRIPTION: Draws a red rectangle at (83, 79) with width 120 and height 108.
; PLAN: r0=83(x), r1=79(y), r2=120(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 79
LDI r2, 120
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
