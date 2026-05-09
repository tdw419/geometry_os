; DESCRIPTION: Places a white 23x17 rectangle at position (128, 76).
; PLAN: r0=128(x), r1=76(y), r2=23(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 76
LDI r2, 23
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
