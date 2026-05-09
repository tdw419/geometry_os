; DESCRIPTION: Places a orange 21x10 rectangle at position (162, 60).
; PLAN: r0=162(x), r1=60(y), r2=21(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 60
LDI r2, 21
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
