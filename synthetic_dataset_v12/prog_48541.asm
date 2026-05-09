; DESCRIPTION: Places a orange 68x57 rectangle at position (239, 105).
; PLAN: r0=239(x), r1=105(y), r2=68(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 105
LDI r2, 68
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
