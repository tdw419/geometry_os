; DESCRIPTION: Places a white 88x20 rectangle at position (108, 75).
; PLAN: r0=108(x), r1=75(y), r2=88(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 75
LDI r2, 88
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
