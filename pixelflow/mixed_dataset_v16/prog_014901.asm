; DESCRIPTION: Places a orange 91x117 rectangle at position (380, 114).
; PLAN: r0=380(x), r1=114(y), r2=91(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 114
LDI r2, 91
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
