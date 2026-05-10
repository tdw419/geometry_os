; DESCRIPTION: Places a magenta 45x62 rectangle at position (204, 27).
; PLAN: r0=204(x), r1=27(y), r2=45(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 27
LDI r2, 45
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
