; DESCRIPTION: Places a orange 55x79 rectangle at position (8, 49).
; PLAN: r0=8(x), r1=49(y), r2=55(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 49
LDI r2, 55
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
