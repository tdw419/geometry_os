; DESCRIPTION: Places a cyan 19x41 rectangle at position (1, 52).
; PLAN: r0=1(x), r1=52(y), r2=19(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 52
LDI r2, 19
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
