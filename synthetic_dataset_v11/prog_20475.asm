; DESCRIPTION: Places a orange 100x43 rectangle at position (65, 192).
; PLAN: r0=65(x), r1=192(y), r2=100(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 192
LDI r2, 100
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
