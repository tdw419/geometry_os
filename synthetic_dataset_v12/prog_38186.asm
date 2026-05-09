; DESCRIPTION: Draws a white rectangle at (154, 99) with width 98 and height 50.
; PLAN: r0=154(x), r1=99(y), r2=98(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 99
LDI r2, 98
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
