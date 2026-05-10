; DESCRIPTION: Draws a orange rectangle at (57, 42) with width 25 and height 46.
; PLAN: r0=57(x), r1=42(y), r2=25(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 42
LDI r2, 25
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
