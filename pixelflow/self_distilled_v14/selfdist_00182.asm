; DESCRIPTION: Places a cyan 29x119 box at position (55, 102).
; PLAN: r0=55(x), r1=102(y), r2=29(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 102
LDI r2, 29
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
