; DESCRIPTION: Places a cyan 99x34 rectangle at position (258, 189).
; PLAN: r0=258(x), r1=189(y), r2=99(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 189
LDI r2, 99
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
