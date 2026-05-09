; DESCRIPTION: Places a orange 30x80 rectangle at position (71, 149).
; PLAN: r0=71(x), r1=149(y), r2=30(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 149
LDI r2, 30
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
