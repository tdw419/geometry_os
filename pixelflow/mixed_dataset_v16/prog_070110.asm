; DESCRIPTION: Places a magenta 88x19 rectangle at position (286, 184).
; PLAN: r0=286(x), r1=184(y), r2=88(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 184
LDI r2, 88
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
