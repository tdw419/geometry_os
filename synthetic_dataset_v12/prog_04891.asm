; DESCRIPTION: Places a orange 53x38 rectangle at position (40, 142).
; PLAN: r0=40(x), r1=142(y), r2=53(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 142
LDI r2, 53
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
