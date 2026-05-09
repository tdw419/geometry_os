; DESCRIPTION: Places a magenta 21x53 rectangle at position (20, 41).
; PLAN: r0=20(x), r1=41(y), r2=21(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 41
LDI r2, 21
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
