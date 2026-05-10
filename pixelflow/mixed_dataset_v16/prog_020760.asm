; DESCRIPTION: Places a black 31x38 rectangle at position (76, 175).
; PLAN: r0=76(x), r1=175(y), r2=31(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 175
LDI r2, 31
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
