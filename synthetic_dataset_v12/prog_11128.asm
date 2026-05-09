; DESCRIPTION: Places a black 76x39 rectangle at position (107, 52).
; PLAN: r0=107(x), r1=52(y), r2=76(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 52
LDI r2, 76
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
