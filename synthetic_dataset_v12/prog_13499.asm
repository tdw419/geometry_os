; DESCRIPTION: Places a cyan 65x13 rectangle at position (67, 149).
; PLAN: r0=67(x), r1=149(y), r2=65(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 149
LDI r2, 65
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
