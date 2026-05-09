; DESCRIPTION: Places a red 41x87 rectangle at position (197, 138).
; PLAN: r0=197(x), r1=138(y), r2=41(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 138
LDI r2, 41
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
