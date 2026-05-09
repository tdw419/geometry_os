; DESCRIPTION: Places a cyan 80x69 rectangle at position (30, 41).
; PLAN: r0=30(x), r1=41(y), r2=80(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 41
LDI r2, 80
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
