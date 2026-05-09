; DESCRIPTION: Places a white 53x70 rectangle at position (14, 186).
; PLAN: r0=14(x), r1=186(y), r2=53(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 186
LDI r2, 53
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
