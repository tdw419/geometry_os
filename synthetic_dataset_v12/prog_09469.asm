; DESCRIPTION: Places a red 53x58 rectangle at position (324, 182).
; PLAN: r0=324(x), r1=182(y), r2=53(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 182
LDI r2, 53
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
