; DESCRIPTION: Places a orange 38x87 rectangle at position (357, 125).
; PLAN: r0=357(x), r1=125(y), r2=38(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 125
LDI r2, 38
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
