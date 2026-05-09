; DESCRIPTION: Places a red 41x54 rectangle at position (28, 115).
; PLAN: r0=28(x), r1=115(y), r2=41(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 115
LDI r2, 41
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
