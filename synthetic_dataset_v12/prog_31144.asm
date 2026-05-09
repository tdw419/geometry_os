; DESCRIPTION: Places a white 41x24 rectangle at position (85, 25).
; PLAN: r0=85(x), r1=25(y), r2=41(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 25
LDI r2, 41
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
