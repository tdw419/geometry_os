; DESCRIPTION: Draws a orange rectangle at (124, 4) with width 42 and height 10.
; PLAN: r0=124(x), r1=4(y), r2=42(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 4
LDI r2, 42
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
