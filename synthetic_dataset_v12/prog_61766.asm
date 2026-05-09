; DESCRIPTION: Places a orange 87x117 rectangle at position (233, 39).
; PLAN: r0=233(x), r1=39(y), r2=87(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 39
LDI r2, 87
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
