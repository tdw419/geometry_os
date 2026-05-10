; DESCRIPTION: Places a orange 20x97 rectangle at position (335, 53).
; PLAN: r0=335(x), r1=53(y), r2=20(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 53
LDI r2, 20
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
