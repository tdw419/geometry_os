; DESCRIPTION: Places a orange 84x10 rectangle at position (60, 131).
; PLAN: r0=60(x), r1=131(y), r2=84(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 131
LDI r2, 84
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
