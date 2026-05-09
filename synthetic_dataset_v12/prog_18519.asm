; DESCRIPTION: Places a cyan 100x18 rectangle at position (337, 227).
; PLAN: r0=337(x), r1=227(y), r2=100(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 227
LDI r2, 100
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
