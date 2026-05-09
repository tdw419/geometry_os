; DESCRIPTION: Places a black 36x62 rectangle at position (138, 137).
; PLAN: r0=138(x), r1=137(y), r2=36(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 137
LDI r2, 36
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
