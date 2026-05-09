; DESCRIPTION: Draws a orange rectangle at (320, 33) with width 42 and height 46.
; PLAN: r0=320(x), r1=33(y), r2=42(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 33
LDI r2, 42
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
