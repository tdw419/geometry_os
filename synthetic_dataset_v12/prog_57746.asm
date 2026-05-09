; DESCRIPTION: Places a cyan 15x54 rectangle at position (227, 76).
; PLAN: r0=227(x), r1=76(y), r2=15(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 76
LDI r2, 15
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
