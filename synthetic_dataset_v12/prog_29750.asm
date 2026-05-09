; DESCRIPTION: Places a red 105x107 rectangle at position (395, 78).
; PLAN: r0=395(x), r1=78(y), r2=105(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 78
LDI r2, 105
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
