; DESCRIPTION: Places a orange 109x22 box at position (252, 125).
; PLAN: r0=252(x), r1=125(y), r2=109(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 125
LDI r2, 109
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
