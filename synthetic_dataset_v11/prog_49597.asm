; DESCRIPTION: Draws a cyan rectangle at (65, 100) with width 85 and height 82.
; PLAN: r0=65(x), r1=100(y), r2=85(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 100
LDI r2, 85
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
