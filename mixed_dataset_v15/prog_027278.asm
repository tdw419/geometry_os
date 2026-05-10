; DESCRIPTION: Places a black 13x81 rectangle at position (401, 43).
; PLAN: r0=401(x), r1=43(y), r2=13(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 43
LDI r2, 13
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
