; DESCRIPTION: Places a orange 68x85 rectangle at position (147, 125).
; PLAN: r0=147(x), r1=125(y), r2=68(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 125
LDI r2, 68
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
