; DESCRIPTION: Places a orange 18x35 rectangle at position (233, 138).
; PLAN: r0=233(x), r1=138(y), r2=18(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 138
LDI r2, 18
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
