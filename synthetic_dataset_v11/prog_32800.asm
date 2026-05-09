; DESCRIPTION: Places a orange 99x12 rectangle at position (154, 203).
; PLAN: r0=154(x), r1=203(y), r2=99(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 203
LDI r2, 99
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
