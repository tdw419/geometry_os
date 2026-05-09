; DESCRIPTION: Places a orange 18x26 rectangle at position (77, 129).
; PLAN: r0=77(x), r1=129(y), r2=18(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 129
LDI r2, 18
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
