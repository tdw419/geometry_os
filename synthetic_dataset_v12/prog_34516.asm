; DESCRIPTION: Draws a orange rectangle at (61, 144) with width 42 and height 109.
; PLAN: r0=61(x), r1=144(y), r2=42(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 144
LDI r2, 42
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
