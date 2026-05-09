; DESCRIPTION: Places a magenta 100x41 rectangle at position (248, 214).
; PLAN: r0=248(x), r1=214(y), r2=100(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 214
LDI r2, 100
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
