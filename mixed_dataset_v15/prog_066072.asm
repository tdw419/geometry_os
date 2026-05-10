; DESCRIPTION: Places a orange 53x33 rectangle at position (370, 21).
; PLAN: r0=370(x), r1=21(y), r2=53(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 21
LDI r2, 53
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
