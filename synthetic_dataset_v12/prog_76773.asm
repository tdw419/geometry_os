; DESCRIPTION: Places a orange 92x13 rectangle at position (150, 87).
; PLAN: r0=150(x), r1=87(y), r2=92(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 87
LDI r2, 92
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
