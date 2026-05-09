; DESCRIPTION: Places a orange 73x52 rectangle at position (166, 65).
; PLAN: r0=166(x), r1=65(y), r2=73(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 65
LDI r2, 73
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
