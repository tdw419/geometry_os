; DESCRIPTION: Places a red 105x52 rectangle at position (19, 139).
; PLAN: r0=19(x), r1=139(y), r2=105(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 139
LDI r2, 105
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
