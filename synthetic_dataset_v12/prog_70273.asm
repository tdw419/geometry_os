; DESCRIPTION: Places a orange 52x49 rectangle at position (232, 192).
; PLAN: r0=232(x), r1=192(y), r2=52(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 192
LDI r2, 52
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
