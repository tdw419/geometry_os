; DESCRIPTION: Places a orange 69x75 rectangle at position (175, 105).
; PLAN: r0=175(x), r1=105(y), r2=69(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 105
LDI r2, 69
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
