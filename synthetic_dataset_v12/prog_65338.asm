; DESCRIPTION: Places a orange 11x61 rectangle at position (198, 149).
; PLAN: r0=198(x), r1=149(y), r2=11(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 149
LDI r2, 11
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
