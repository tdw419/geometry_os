; DESCRIPTION: Places a magenta 10x43 rectangle at position (57, 41).
; PLAN: r0=57(x), r1=41(y), r2=10(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 41
LDI r2, 10
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
