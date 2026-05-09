; DESCRIPTION: Places a cyan 41x69 rectangle at position (72, 172).
; PLAN: r0=72(x), r1=172(y), r2=41(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 172
LDI r2, 41
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
