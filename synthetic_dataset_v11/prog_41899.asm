; DESCRIPTION: Places a orange 18x46 rectangle at position (96, 99).
; PLAN: r0=96(x), r1=99(y), r2=18(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 99
LDI r2, 18
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
