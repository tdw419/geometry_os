; DESCRIPTION: Places a yellow 100x41 rectangle at position (357, 175).
; PLAN: r0=357(x), r1=175(y), r2=100(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 175
LDI r2, 100
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
