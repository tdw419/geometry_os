; DESCRIPTION: Places a orange 21x85 rectangle at position (213, 119).
; PLAN: r0=213(x), r1=119(y), r2=21(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 119
LDI r2, 21
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
