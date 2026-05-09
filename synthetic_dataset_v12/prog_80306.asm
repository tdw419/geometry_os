; DESCRIPTION: Draws a orange rectangle at (429, 71) with width 21 and height 42.
; PLAN: r0=429(x), r1=71(y), r2=21(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 71
LDI r2, 21
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
