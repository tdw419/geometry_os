; DESCRIPTION: Places a yellow 105x41 rectangle at position (100, 5).
; PLAN: r0=100(x), r1=5(y), r2=105(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 5
LDI r2, 105
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
