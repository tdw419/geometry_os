; DESCRIPTION: Places a orange 79x29 rectangle at position (131, 6).
; PLAN: r0=131(x), r1=6(y), r2=79(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 6
LDI r2, 79
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
