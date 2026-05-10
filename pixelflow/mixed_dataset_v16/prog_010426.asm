; DESCRIPTION: Places a cyan 26x63 rectangle at position (106, 41).
; PLAN: r0=106(x), r1=41(y), r2=26(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 41
LDI r2, 26
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
