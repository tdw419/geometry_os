; DESCRIPTION: Places a cyan 115x76 rectangle at position (101, 0).
; PLAN: r0=101(x), r1=0(y), r2=115(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 0
LDI r2, 115
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
