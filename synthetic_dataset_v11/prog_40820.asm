; DESCRIPTION: Draws a orange rectangle at (57, 58) with width 56 and height 50.
; PLAN: r0=57(x), r1=58(y), r2=56(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 58
LDI r2, 56
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
