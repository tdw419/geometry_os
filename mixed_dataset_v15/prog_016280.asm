; DESCRIPTION: Places a cyan 41x114 rectangle at position (100, 113).
; PLAN: r0=100(x), r1=113(y), r2=41(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 113
LDI r2, 41
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
