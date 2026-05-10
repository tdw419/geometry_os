; DESCRIPTION: Places a red 88x85 rectangle at position (19, 120).
; PLAN: r0=19(x), r1=120(y), r2=88(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 120
LDI r2, 88
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
