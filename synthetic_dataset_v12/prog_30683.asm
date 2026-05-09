; DESCRIPTION: Places a orange 100x116 rectangle at position (308, 124).
; PLAN: r0=308(x), r1=124(y), r2=100(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 124
LDI r2, 100
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
