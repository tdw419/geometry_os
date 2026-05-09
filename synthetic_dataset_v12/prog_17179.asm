; DESCRIPTION: Places a cyan 66x119 rectangle at position (102, 58).
; PLAN: r0=102(x), r1=58(y), r2=66(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 58
LDI r2, 66
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
