; DESCRIPTION: Places a cyan 62x101 rectangle at position (46, 78).
; PLAN: r0=46(x), r1=78(y), r2=62(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 78
LDI r2, 62
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
