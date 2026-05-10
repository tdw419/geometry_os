; DESCRIPTION: Places a cyan 41x118 rectangle at position (405, 2).
; PLAN: r0=405(x), r1=2(y), r2=41(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 2
LDI r2, 41
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
