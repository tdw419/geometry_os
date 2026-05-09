; DESCRIPTION: Places a cyan 41x25 rectangle at position (203, 157).
; PLAN: r0=203(x), r1=157(y), r2=41(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 157
LDI r2, 41
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
