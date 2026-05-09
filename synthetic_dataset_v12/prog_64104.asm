; DESCRIPTION: Places a red 35x82 rectangle at position (100, 102).
; PLAN: r0=100(x), r1=102(y), r2=35(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 102
LDI r2, 35
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
