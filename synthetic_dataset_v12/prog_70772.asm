; DESCRIPTION: Draws a orange rectangle at (309, 124) with width 16 and height 82.
; PLAN: r0=309(x), r1=124(y), r2=16(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 124
LDI r2, 16
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
