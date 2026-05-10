; DESCRIPTION: Places a cyan 41x84 box at position (24, 140).
; PLAN: r0=24(x), r1=140(y), r2=41(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 140
LDI r2, 41
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
