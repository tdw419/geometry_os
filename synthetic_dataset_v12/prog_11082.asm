; DESCRIPTION: Draws a orange rectangle at (354, 58) with width 83 and height 48.
; PLAN: r0=354(x), r1=58(y), r2=83(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 58
LDI r2, 83
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
