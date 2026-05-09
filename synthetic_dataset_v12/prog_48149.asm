; DESCRIPTION: Places a orange 71x80 rectangle at position (253, 23).
; PLAN: r0=253(x), r1=23(y), r2=71(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 23
LDI r2, 71
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
