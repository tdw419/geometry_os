; DESCRIPTION: Places a white 53x81 rectangle at position (115, 46).
; PLAN: r0=115(x), r1=46(y), r2=53(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 46
LDI r2, 53
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
