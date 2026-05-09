; DESCRIPTION: Places a orange 109x104 rectangle at position (18, 66).
; PLAN: r0=18(x), r1=66(y), r2=109(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 66
LDI r2, 109
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
