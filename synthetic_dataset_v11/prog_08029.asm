; DESCRIPTION: Places a green 41x51 rectangle at position (126, 139).
; PLAN: r0=126(x), r1=139(y), r2=41(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 139
LDI r2, 41
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
