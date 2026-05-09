; DESCRIPTION: Places a red 25x85 rectangle at position (78, 64).
; PLAN: r0=78(x), r1=64(y), r2=25(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 64
LDI r2, 25
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
