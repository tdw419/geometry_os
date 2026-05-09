; DESCRIPTION: Places a orange 102x66 rectangle at position (81, 102).
; PLAN: r0=81(x), r1=102(y), r2=102(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 102
LDI r2, 102
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
