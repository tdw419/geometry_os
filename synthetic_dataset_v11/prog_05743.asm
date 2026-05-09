; DESCRIPTION: Places a orange 95x52 rectangle at position (29, 89).
; PLAN: r0=29(x), r1=89(y), r2=95(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 89
LDI r2, 95
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
