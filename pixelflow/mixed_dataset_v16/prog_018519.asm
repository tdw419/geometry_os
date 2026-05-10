; DESCRIPTION: Places a red 119x36 rectangle at position (268, 49).
; PLAN: r0=268(x), r1=49(y), r2=119(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 49
LDI r2, 119
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
