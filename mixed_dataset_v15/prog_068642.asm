; DESCRIPTION: Places a orange 41x111 rectangle at position (6, 100).
; PLAN: r0=6(x), r1=100(y), r2=41(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 100
LDI r2, 41
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
