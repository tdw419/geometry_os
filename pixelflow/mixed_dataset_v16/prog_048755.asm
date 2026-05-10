; DESCRIPTION: Places a orange 41x117 rectangle at position (175, 112).
; PLAN: r0=175(x), r1=112(y), r2=41(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 112
LDI r2, 41
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
