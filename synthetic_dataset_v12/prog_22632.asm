; DESCRIPTION: Places a magenta 27x41 rectangle at position (287, 140).
; PLAN: r0=287(x), r1=140(y), r2=27(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 140
LDI r2, 27
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
