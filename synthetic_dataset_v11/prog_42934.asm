; DESCRIPTION: Places a cyan 28x97 rectangle at position (227, 62).
; PLAN: r0=227(x), r1=62(y), r2=28(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 62
LDI r2, 28
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
