; DESCRIPTION: Places a magenta 56x36 box at position (79, 41).
; PLAN: r0=79(x), r1=41(y), r2=56(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 41
LDI r2, 56
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
