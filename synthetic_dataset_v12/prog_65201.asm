; DESCRIPTION: Places a orange 105x62 rectangle at position (121, 45).
; PLAN: r0=121(x), r1=45(y), r2=105(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 45
LDI r2, 105
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
