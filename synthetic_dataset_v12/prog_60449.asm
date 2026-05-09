; DESCRIPTION: Places a orange 119x60 rectangle at position (33, 21).
; PLAN: r0=33(x), r1=21(y), r2=119(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 21
LDI r2, 119
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
