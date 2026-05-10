; DESCRIPTION: Places a orange 54x35 rectangle at position (373, 203).
; PLAN: r0=373(x), r1=203(y), r2=54(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 203
LDI r2, 54
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
