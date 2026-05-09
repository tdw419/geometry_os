; DESCRIPTION: Places a green 41x66 rectangle at position (156, 43).
; PLAN: r0=156(x), r1=43(y), r2=41(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 43
LDI r2, 41
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
