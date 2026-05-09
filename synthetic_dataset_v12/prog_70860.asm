; DESCRIPTION: Places a orange 33x41 rectangle at position (419, 118).
; PLAN: r0=419(x), r1=118(y), r2=33(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 118
LDI r2, 33
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
