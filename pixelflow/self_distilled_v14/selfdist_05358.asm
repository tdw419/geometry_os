; DESCRIPTION: Places a cyan 41x106 box at position (69, 90).
; PLAN: r0=69(x), r1=90(y), r2=41(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 90
LDI r2, 41
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
