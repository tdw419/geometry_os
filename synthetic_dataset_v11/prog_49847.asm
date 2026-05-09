; DESCRIPTION: Places a blue 41x43 rectangle at position (156, 16).
; PLAN: r0=156(x), r1=16(y), r2=41(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 16
LDI r2, 41
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
