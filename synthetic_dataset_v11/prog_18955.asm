; DESCRIPTION: Places a cyan 23x41 rectangle at position (207, 153).
; PLAN: r0=207(x), r1=153(y), r2=23(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 153
LDI r2, 23
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
