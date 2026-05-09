; DESCRIPTION: Places a cyan 44x41 rectangle at position (23, 178).
; PLAN: r0=23(x), r1=178(y), r2=44(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 178
LDI r2, 44
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
