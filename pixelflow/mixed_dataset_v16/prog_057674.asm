; DESCRIPTION: Places a white 14x50 rectangle at position (381, 121).
; PLAN: r0=381(x), r1=121(y), r2=14(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 121
LDI r2, 14
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
