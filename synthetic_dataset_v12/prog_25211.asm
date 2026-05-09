; DESCRIPTION: Renders a orange box of size 75x12 starting at (390, 204).
; PLAN: r0=390(x), r1=204(y), r2=75(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 204
LDI r2, 75
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
