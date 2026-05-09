; DESCRIPTION: Places a black 34x19 rectangle at position (28, 176).
; PLAN: r0=28(x), r1=176(y), r2=34(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 176
LDI r2, 34
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
