; DESCRIPTION: Places a red 52x83 rectangle at position (53, 165).
; PLAN: r0=53(x), r1=165(y), r2=52(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 165
LDI r2, 52
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
