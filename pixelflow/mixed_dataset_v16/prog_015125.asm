; DESCRIPTION: Draws a orange rectangle at (186, 135) with width 55 and height 42.
; PLAN: r0=186(x), r1=135(y), r2=55(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 135
LDI r2, 55
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
