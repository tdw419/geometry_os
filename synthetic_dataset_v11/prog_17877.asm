; DESCRIPTION: Draws a red rectangle at (85, 16) with width 120 and height 98.
; PLAN: r0=85(x), r1=16(y), r2=120(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 16
LDI r2, 120
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
