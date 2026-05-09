; DESCRIPTION: Places a white 41x32 rectangle at position (156, 73).
; PLAN: r0=156(x), r1=73(y), r2=41(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 73
LDI r2, 41
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
