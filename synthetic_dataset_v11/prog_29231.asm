; DESCRIPTION: Places a red 39x62 rectangle at position (172, 53).
; PLAN: r0=172(x), r1=53(y), r2=39(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 53
LDI r2, 39
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
