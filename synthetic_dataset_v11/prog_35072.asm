; DESCRIPTION: Places a cyan 109x83 rectangle at position (88, 46).
; PLAN: r0=88(x), r1=46(y), r2=109(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 46
LDI r2, 109
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
