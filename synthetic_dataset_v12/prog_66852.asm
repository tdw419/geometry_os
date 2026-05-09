; DESCRIPTION: Places a orange 41x25 rectangle at position (127, 41).
; PLAN: r0=127(x), r1=41(y), r2=41(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 41
LDI r2, 41
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
