; DESCRIPTION: Places a orange 21x106 rectangle at position (254, 48).
; PLAN: r0=254(x), r1=48(y), r2=21(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 48
LDI r2, 21
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
