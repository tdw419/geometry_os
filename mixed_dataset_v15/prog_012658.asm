; DESCRIPTION: Places a magenta 41x52 rectangle at position (428, 109).
; PLAN: r0=428(x), r1=109(y), r2=41(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 109
LDI r2, 41
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
