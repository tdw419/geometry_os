; DESCRIPTION: Places a orange 77x117 rectangle at position (202, 72).
; PLAN: r0=202(x), r1=72(y), r2=77(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 72
LDI r2, 77
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
