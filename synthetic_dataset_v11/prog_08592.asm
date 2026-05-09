; DESCRIPTION: Places a magenta 93x107 rectangle at position (51, 41).
; PLAN: r0=51(x), r1=41(y), r2=93(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 41
LDI r2, 93
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
