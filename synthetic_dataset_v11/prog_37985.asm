; DESCRIPTION: Draws a orange rectangle at (150, 106) with width 42 and height 112.
; PLAN: r0=150(x), r1=106(y), r2=42(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 106
LDI r2, 42
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
