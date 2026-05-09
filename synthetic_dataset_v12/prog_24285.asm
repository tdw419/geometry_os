; DESCRIPTION: Draws a orange rectangle at (271, 177) with width 86 and height 16.
; PLAN: r0=271(x), r1=177(y), r2=86(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 177
LDI r2, 86
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
