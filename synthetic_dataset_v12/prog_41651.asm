; DESCRIPTION: Places a cyan 35x41 rectangle at position (238, 85).
; PLAN: r0=238(x), r1=85(y), r2=35(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 85
LDI r2, 35
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
