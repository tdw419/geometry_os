; DESCRIPTION: Places a white 53x40 rectangle at position (108, 186).
; PLAN: r0=108(x), r1=186(y), r2=53(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 186
LDI r2, 53
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
