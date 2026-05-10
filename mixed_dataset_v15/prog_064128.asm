; DESCRIPTION: Places a red 49x90 rectangle at position (19, 35).
; PLAN: r0=19(x), r1=35(y), r2=49(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 35
LDI r2, 49
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
