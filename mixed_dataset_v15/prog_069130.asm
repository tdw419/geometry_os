; DESCRIPTION: Places a orange 15x80 rectangle at position (318, 155).
; PLAN: r0=318(x), r1=155(y), r2=15(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 155
LDI r2, 15
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
