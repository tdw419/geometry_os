; DESCRIPTION: Places a white 31x17 rectangle at position (184, 49).
; PLAN: r0=184(x), r1=49(y), r2=31(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 49
LDI r2, 31
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
