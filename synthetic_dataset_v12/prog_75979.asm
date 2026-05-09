; DESCRIPTION: Places a white 17x63 rectangle at position (437, 62).
; PLAN: r0=437(x), r1=62(y), r2=17(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 62
LDI r2, 17
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
