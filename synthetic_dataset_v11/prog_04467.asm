; DESCRIPTION: Places a orange 57x66 rectangle at position (137, 12).
; PLAN: r0=137(x), r1=12(y), r2=57(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 12
LDI r2, 57
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
