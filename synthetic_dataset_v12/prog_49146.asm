; DESCRIPTION: Places a cyan 66x119 rectangle at position (290, 116).
; PLAN: r0=290(x), r1=116(y), r2=66(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 116
LDI r2, 66
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
