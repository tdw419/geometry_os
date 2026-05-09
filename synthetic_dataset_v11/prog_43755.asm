; DESCRIPTION: Places a yellow 41x72 rectangle at position (156, 61).
; PLAN: r0=156(x), r1=61(y), r2=41(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 61
LDI r2, 41
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
