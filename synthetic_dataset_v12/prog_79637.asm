; DESCRIPTION: Places a white 58x82 rectangle at position (311, 170).
; PLAN: r0=311(x), r1=170(y), r2=58(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 170
LDI r2, 58
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
