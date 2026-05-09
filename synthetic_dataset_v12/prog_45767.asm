; DESCRIPTION: Places a white 83x119 rectangle at position (242, 66).
; PLAN: r0=242(x), r1=66(y), r2=83(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 66
LDI r2, 83
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
