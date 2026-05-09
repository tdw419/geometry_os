; DESCRIPTION: Places a orange 90x79 rectangle at position (354, 45).
; PLAN: r0=354(x), r1=45(y), r2=90(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 45
LDI r2, 90
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
