; DESCRIPTION: Places a cyan 68x118 rectangle at position (433, 41).
; PLAN: r0=433(x), r1=41(y), r2=68(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 41
LDI r2, 68
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
