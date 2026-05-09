; DESCRIPTION: Places a orange 87x28 rectangle at position (232, 225).
; PLAN: r0=232(x), r1=225(y), r2=87(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 225
LDI r2, 87
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
