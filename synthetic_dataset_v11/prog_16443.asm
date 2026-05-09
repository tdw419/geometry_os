; DESCRIPTION: Places a orange 19x73 rectangle at position (164, 77).
; PLAN: r0=164(x), r1=77(y), r2=19(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 77
LDI r2, 19
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
