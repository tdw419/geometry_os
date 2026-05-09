; DESCRIPTION: Places a magenta 19x13 rectangle at position (295, 184).
; PLAN: r0=295(x), r1=184(y), r2=19(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 184
LDI r2, 19
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
