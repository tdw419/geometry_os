; DESCRIPTION: Places a black 88x57 rectangle at position (184, 38).
; PLAN: r0=184(x), r1=38(y), r2=88(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 38
LDI r2, 88
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
