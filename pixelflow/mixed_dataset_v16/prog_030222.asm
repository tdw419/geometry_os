; DESCRIPTION: Places a red 43x19 rectangle at position (377, 6).
; PLAN: r0=377(x), r1=6(y), r2=43(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 6
LDI r2, 43
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
