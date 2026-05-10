; DESCRIPTION: Places a orange 21x10 box at position (244, 173).
; PLAN: r0=244(x), r1=173(y), r2=21(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 173
LDI r2, 21
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
