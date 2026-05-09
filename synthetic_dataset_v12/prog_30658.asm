; DESCRIPTION: Places a orange 85x70 rectangle at position (145, 45).
; PLAN: r0=145(x), r1=45(y), r2=85(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 45
LDI r2, 85
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
