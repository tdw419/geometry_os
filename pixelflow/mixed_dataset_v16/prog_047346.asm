; DESCRIPTION: Places a orange 47x31 rectangle at position (221, 181).
; PLAN: r0=221(x), r1=181(y), r2=47(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 181
LDI r2, 47
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
