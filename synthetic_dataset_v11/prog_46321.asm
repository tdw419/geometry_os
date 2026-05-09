; DESCRIPTION: Places a cyan 106x19 rectangle at position (62, 99).
; PLAN: r0=62(x), r1=99(y), r2=106(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 99
LDI r2, 106
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
