; DESCRIPTION: Places a cyan 41x71 rectangle at position (89, 145).
; PLAN: r0=89(x), r1=145(y), r2=41(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 145
LDI r2, 41
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
